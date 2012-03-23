backendResponse = {
  month: 'Marzo', 
  year: '2012',
  dayn: ['D', 'L', 'M', 'Mi', 'J', 'V', 'S'],
  days: [
    [null, null, null, null, 1, 2, 3],
    [4,       5,    6,    7, 8, 9, 10],
    [11, 12, 13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22, 23, 24],
    [25,26,27,28,29,30,31]
  ],
  marks: [
    [0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0],
    [0,1,0,0,0,0,0],
    [0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0]
  ]
  events: {
    '12': [
      {
        hora: '09:00',
        desc: 'SuperClase - Ballet',
        longdesc: 'Superclase de 2 horas ',
        cupo: 8,
        cls: 'abdominales'
      },
      {
        hora: '10:00',
        desc: 'SuperClase - Danza Arabe',
        longdesc: 'Superclase de 2 horas  de danza arabe',
        cupo: 5,
        cls: 'abdominales'
      },
      {
        hora: '11:00',
        desc: 'Cardio',
        longdesc: 'Consurso de cardio',
        cupo: 8,
        cls: 'bici'
      },
      {
        hora: '13:00',
        desc: 'Natacion',
        longdesc: 'Carrera acuática',
        cupo: 12,
        cls: 'caminadora'
      },
      {
        hora: '14:00',
        desc: 'Futbol',
        longdesc: 'Torneo de futbol rápido',
        cupo: 8,
        cls: 'pesas'
      },
      {
        hora: '17:00',
        desc: 'Aerobics',
        longdesc: 'Super clase de Aerobics gratis, trae a tus amigos',
        cupo: 12,
        cls: 'abdominales'
      },
      {
        hora: '19:00',
        desc: 'Tae Bo',
        longdesc: 'Super clase de Tae Bo gratis, trae a tus amigos',
        cupo: 8,
        cls: 'pesas'
      },
      {
        hora: '19:30',
        desc: 'Spinning',
        longdesc: 'Super clase de Spinning',
        cupo: 12,
        cls: 'bici'
      }
    ],
    '22': [
      {
        hora: '07:00',
        desc: 'Tae-bo',
        longdesc: 'Clase muestra de Tae Bo',
        cupo: 10,
        cls: 'bici'
      },
      {
        hora: '20:00',
        desc: 'Football',
        longdesc: 'Torneo de futbol',
        cupo: 22,
        cls: 'pesas'
      }
    ]
  }
}
eventWindow={};
exports.Class = View.extend

  init: ->
    self = @
    eventWin = Ti.App.win
    @children = [
      K.jade('events.jade', backendResponse),
      {
        type: 'scrollview', 
        children: [ {
          type: 'tableview'
          className: 'list'
        }], 
        top: 50 + (24 * backendResponse.days.length)
      }
    ]
    
    @_super.apply(@, arguments)
    
    tableview = $(@el).find('.list').get(0)
    
    $(@el).find('.days').bind 'click', (event)->
      idx = event.index
      row = event.source.row
      day = backendResponse.days[row][idx].toString()
      
      tableview.data = []
      tableview.setData []
      evs = backendResponse.events[day]
      
      if evs
        data = evs.map (ev)->
          tr = K.createTableViewRow({
            className: ev.cls,
            events:{
              click:(event) ->
                  Ti.App.useWin('eventDetail', 'Detalle del evento', eventWin,{event:ev}) 
            }  
            children: [
              { 
                type: 'label',
                text: ev.desc,
                left: 50
              },
              {
                type: 'label',
                text: ev.hora,
                left: 0 
              },
              {
                type: 'imageview',
                image: "image/activities/#{ev.cls}.png",
                left: 300,
                right: 5
              }
            ]
          })
          tr
        tableview.data = data
        tableview.setData data
        
        
