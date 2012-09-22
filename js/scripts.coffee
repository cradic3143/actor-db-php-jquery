Actors = 
  init: (@config) ->
    @setupTemplates()
    @bindEvents()

  bindEvents: ->
    @config.letterSelection.on 'change', @fetchActors 

  setupTemplates: ->
    @config.actorListTemplate = Handlebars.compile( @config.actorListTemplate );

    Handlebars.registerHelper( 'fullName', (actor) ->
      "#{actor.first_name} #{actor.last_name}"
    )

  fetchActors: ->
    self = Actors
    console.log self.config.form.serialize()

    $.ajax({
      url: 'index.php'
      type: 'POST'
      data: self.config.form.serialize()
      dataType: 'json'
      success: (results) ->
        # clear out list
        self.config.actorsList.html('')

        if results[0]
          self.config.actorsList.append( self.config.actorListTemplate( results ) )
        else
          self.config.actorsList.append('No results found')
    })
  
Actors.init 
  letterSelection: $('#q')
  form: $('#action-selector')
  actorListTemplate: $('#actor-list-template').html()
  actorsList: $('ul.actors-list')
