Ti.Geolocation.preferredProvider = "gps";
Ti.Geolocation.purpose = "GPS demo";
Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_HUNDRED_METERS;
Titanium.Geolocation.distanceFilter = 10;

exports.Class = View.extend
  init:(args) ->
    self = @
    Ti.API.info 'here before brand'
    Ti.API.info args
    brand = args.brand
   
    @className = 'brands'
    annotation = Titanium.Map.createAnnotation({
      latitude:brand.latitude,
      longitude:brand.longitude,
      title:brand.name,
      subtitle:'Sport center',
      animate:true,
      pincolor:Titanium.Map.ANNOTATION_GREEN
    })
    
    mapview = Titanium.Map.createView({
      top: 0,
      left: 0,
      width: '100%',
      height: 220,
      mapType: Titanium.Map.STANDARD_TYPE,
      region: {
        latitude:brand.latitude,
        longitude:brand.longitude,
        latitudeDelta:0.01,
        longitudeDelta:0.01
      },
      animate:true,
      regionFit:true,
      userLocation:true,
      annotations:[annotation]
    });
    activitiesImg = brand.activities.map (activity, i) -> 
                type:'imageview',
                image:'image/activities/'+activity.cls + '.png'
                left: (55 * i) 
                className:'activityView'
    @children = [
      {
        type:'label',
        text: brand.name,
        className:'title'
      }
      {
        type:'label',
        text:brand.address,
        className:'address'
      }
      {
        type:'view',
        className:'activitiesImages',
        children: activitiesImg 
          
      }
 
    ]
  
    @_super.apply(@, arguments)
    Ti.App.win.add mapview