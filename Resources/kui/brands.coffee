
Ti.Geolocation.preferredProvider = "gps";
Ti.Geolocation.purpose = "GPS demo";
Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_HUNDRED_METERS;
Titanium.Geolocation.distanceFilter = 10;

sucursales = [
  { 
    name:'Sportium Ciudad Satelite', 
    latitude:19.510609, longitude:-99.241562, address:'Satelite', 
    activities: [ 
      {cls:'bici' }, {cls:'caminadora' }, {cls:'nado' } 
    ] 
  },
  { 
    name:'San Angel' , latitude:19.353583, longitude:-99.188347 ,
    address:'Insurgentes Sur, Chimalistac, Álvaro Obregón, Ciudad de México, Distrito Federal', activities:[{cls:'caminadora' },{cls:'nado' }]
  },
  { 
    name:'Sportium Naucalpan' , latitude:19.491232, longitude:-99.245639 , 
    address:'Colina de La Paz 25, Boulevares, 53140 Naucalpan de Juárez, México', activities:[{cls:'bici' },{cls:'caminadora' },{cls:'nado' },{cls:'pesas' }]
  },
  { 
    name:'Sportium Coyoacán' , latitude:19.32872, longitude:-99.147148, 
    address:'Clavel 70, Coyoacán, 04380 Distrito Federal', activities:[{cls:'pesas' },{cls:'abdominales' }]
  }
]

annotations = sucursales.map (point) ->
  Titanium.Map.createAnnotation({
    latitude:point.latitude,
    longitude:point.longitude,
    title:point.name,
    subtitle:'Sport center',
    animate:true,
    pincolor:Titanium.Map.ANNOTATION_GREEN
    
  })



mapview = Titanium.Map.createView({
    top: 10,
    left: "5%",
    width: '90%',
    height: 220,
    borderRadius: 10,
    opacity: 0.5
    mapType: Titanium.Map.STANDARD_TYPE,
    region: {
      latitude:19.420000,
      longitude:-99.210000,
      latitudeDelta:0.065,
      longitudeDelta:0.065
    },
    animate:true,
    regionFit:true,
    #userLocation:true,
    annotations:annotations
    className: "map"
  });
  
exports.Class = View.extend
  init: ->
    @className = 'brands'
    brandWin = Ti.App.win
    
    
    tableRows= sucursales.map (sucursal) ->
      tvr = K.createTableViewRow()
      $({type:'label', text:sucursal.name, className: "labelRow"}).appendTo tvr
      showDetail = (event)->
        Ti.API.info 'aqui'
        Ti.App.useWin('brandDetail', 'Detalle de la sucursal', brandWin,{ brand: sucursal }) 
      $(tvr).bind 'click', showDetail
      tvr
    @children = [ 
      {type:'tableview',data:tableRows, className: "mapTableView"} 
    ]
    
    
    @_super.apply(@, arguments)
    
    Ti.App.win.setBackgroundImage "image/brandsbg.png"
    Ti.App.win.add mapview
    
    
