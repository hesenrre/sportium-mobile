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
        cupo: 8,
        cls: 'abdominales'
      },
      {
        hora: '10:00',
        desc: 'SuperClase - Danza Arabe',
        cupo: 5,
        cls: 'abdominales'
      },
      {
        hora: '11:00',
        desc: 'Cardio',
        cupo: 8,
        cls: 'bici'
      },
      {
        hora: '13:00',
        desc: 'Natacion',
        cupo: 12,
        cls: 'caminadora'
      },
      {
        hora: '14:00',
        desc: 'Futbol',
        cupo: 8,
        cls: 'pesas'
      },
      {
        hora: '17:00',
        desc: 'Aerobics',
        cupo: 12,
        cls: 'abdominales'
      },
      {
        hora: '19:00',
        desc: 'Tae Bo',
        cupo: 8,
        cls: 'pesas'
      },
      {
        hora: '19:30',
        desc: 'Spinning',
        cupo: 12,
        cls: 'bici'
      }
    ],
    '22': [
      {
        hora: '07:00',
        desc: 'Tae-bo',
        cupo: 10,
        cls: 'bici'
      },
      {
        hora: '20:00',
        desc: 'Football',
        cupo: 22,
        cls: 'pesas'
      }
    ]
  }
}

exports.Class = View.extend

  init: ->
    self = @
    @children = [
      K.jade('events.jade', backendResponse)
    ]

    @_super.apply(@, arguments)
        
    $('.days').bind 'click', (event)->
      idx = event.index
      row = event.source.row
      day = backendResponse.days[row][idx].toString()
      
      $('.list').get(0).data = []
      evs = backendResponse.events[day]
      if evs
        $('.list').get(0).data = evs.map (ev)->
          tr = K.createTableViewRow({
            className: ev.cls,
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
        
        
