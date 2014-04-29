if Meteor.isClient
	Template.hello.greeting = ->
		"Welcome to meteor."

	Template.hello.events "click input": ->
		console.log "You pressed the button"

test = new Meteor.Collection "test"

if Meteor.isServer
	test.remove {}

	ctc.AddCsvToCollection "csv/myData.csv", test, (jsonArray) ->
		console.log "fetch test: "
		console.log test.find().fetch()

	collection = ctc.CreateCollection 'csv/myData.csv', (jsonArray) ->
		console.log "fetch : collection"
		console.log collection.find().fetch()
