Actors = 
  #
  # bootstrap class
  #
  init: (@config) ->
    @setupTemplates()
    @bindEvents()

    # setup all ajax calls with these options
    $.ajaxSetup
      url: 'index.php'
      type: 'POST'
      dataType: 'json'

  #
  # bind event handler
  #
  bindEvents: ->
    @config.letterSelection.on 'change', @fetchActors 
    @config.actorsList.on 'click', 'li', @displayActorInfo
    @config.actorInfo.on 'click', 'span.close', @closeOverlay

  #
  # setup handlebar templates
  #
  setupTemplates: ->
    @config.actorListTemplate = Handlebars.compile( @config.actorListTemplate )
    @config.actorInfoTemplate = Handlebars.compile( @config.actorInfoTemplate )

    # Handlebar helper for fullname concat
    Handlebars.registerHelper 'fullName', (actor) ->
      "#{actor.first_name} #{actor.last_name}"

  #
  # Get list of Actors names
  #
  fetchActors: ->
    self = Actors

    $.ajax
      data: self.config.form.serialize()
      success: (results) ->
        # clear out list
        self.config.actorsList.html('')
  
        if results[0]
          self.config.actorsList.append self.config.actorListTemplate( results ) 
        else
          self.config.actorsList.append 'No results found'

  #
  # Display info for one actor
  #
  displayActorInfo: (e) ->
    self = Actors

    self.config.actorInfo.slideUp( 300 )

    $.ajax
      data: 
        actor_id: $(@).data 'actor_id'
      success: (results) ->
    .done (results) ->
      self.config.actorInfo.html( self.config.actorInfoTemplate( results ) ).slideDown( 300 )

    e.preventDefault()
  
  #
  # close overlay from actor info detail
  #
  closeOverlay: ->
    self = Actors
    self.config.actorInfo.slideUp( 300 )
  
# Begin firing the class with config options
Actors.init 
  letterSelection: $('#q')
  form: $('#action-selector')
  actorListTemplate: $('#actor-list-template').html()
  actorsList: $('ul.actors-list')
  actorInfo: $('.actor-info')
  actorInfoTemplate: $('#actor-info-template').html()
