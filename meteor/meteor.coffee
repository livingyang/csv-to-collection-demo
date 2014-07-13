if Meteor.isClient
	Template.hello.csvFileCollection = ->
		JSON.stringify publicCsvCollection.find().fetch()

	Template.hello.csvStringCollection = ->
		JSON.stringify csvStringCollection.find().fetch()

	Template.hello.events "click input": ->
		console.log "You pressed the button"

publicCsvPath = "csv/myData.csv"
# create a collection with name "myData.csv"
publicCsvCollection = c2c.createCollection publicCsvPath

csvString = "_id,a,b\n1,2,3\n3,4,5"
csvStringCollection = new Meteor.Collection "custom"

if Meteor.isServer
	# public csv file to collection
	publicCsvCollection.remove {}
	c2c.addPublicCsvToCollection publicCsvCollection, publicCsvPath
	console.log "publicCsvCollection:"
	console.log publicCsvCollection.find().fetch()

	# csv string to collection
	csvStringCollection.remove {}
	c2c.addCsvStringToCollection csvStringCollection, csvString
	console.log "csvStringCollection:"
	console.log csvStringCollection.find().fetch()
