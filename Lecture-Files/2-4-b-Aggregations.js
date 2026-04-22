// examples for aggregations
// old style aggregation with javascript function inside, DOES NOT WORK anymore
db.regs.aggregate({
	initial: { count:0,  pc:0, rc:0 },
	reduce: function(r, output) { 
					output.count++; 
					output.pc = output.pc + r.players.length;
					output.rc = output.rc + r.registrations.length;
					},
	cond: { 'regdate': { $gt : "2002/01/01"} },
	key: { 'team.name' : true }
})


// new style
// group by team name and count the number of players per team
db.regs.aggregate([
	{
		$group:  { _id: "$team.name", playerscount: { $sum : { $size: "$players" }} }
	}
])
// group by team name and count the number of players per team for teams that registered after 2008/01/01
db.regs.aggregate([
	{
		$match:  { 'regdate': { $gt : "2008/01/01"} }
	},
	{
		$group:  { _id: "$team.name", playerscount: { $sum : { $size: "$players" }} }
	}
])

// group by registration date and count the number of players per registration date, sort by registration date
// how many players registered on which date?
db.regs.aggregate([
	{
		$group:  { _id: "$regdate", playerscount: { $sum : { $size: "$players" }} }
	},
	{
		$sort: { _id: 1 }
	}
])

// same, but sort by number of players, this meanes: on which date did most players register?
db.regs.aggregate([
	{
		$group:  { _id: "$regdate", playerscount: { $sum : { $size: "$players" }} }
	},
	{
		$sort: { playerscount: -1 }
	}
])


// group by registration date and count the number of registrations 
db.regs.aggregate( [
	{	$match:  { 'regdate': { $gte : "2000/01/01"}}},
	{	$match:  { 'regdate': { $lt : "2020/01/01"}}},
	{
    	$group: {
       		_id: '$regdate',
       		count: { $sum: 1 }}
  	}
] )

// count the number of registrations per team, sort by number of registrations = most frequent teams
db.regs.aggregate( [
	{	$match:  { 'regdate': { $gte : "2000/01/01"}}},
	{	$match:  { 'regdate': { $lt : "2020/01/01"}}},
	{
    	$group: {
       		_id: '$team.name',
       		count: { $sum: 1 }}
  	},
	{	$sort: { count: -1 }}
] )


	
// first project the array, then unwind it, then project the name of the player only
db.regs.aggregate( [ 
	{ $unwind : "$players" },
] )
db.regs.aggregate( [ 
	{ $project: { "players": 1} },
	{ $unwind : "$players" },
] )
// focus on the name of the player only
db.regs.aggregate( [ 
	{ $project: { "players": 1} },
	{ $unwind : "$players" },
	{ $project: { "players.name": 1} },
] )
// focus on the name of the player only and suppress the _id field 
db.regs.aggregate( [ 
	{ $project: { "players": 1} },
	{ $unwind : "$players" },
	{ $project: { "players.name": 1} },
	{ $project: { "_id": 0} },
] )


// deliver document with one player per document
db.regs.aggregate([
  { $unwind: "$players" },
])

// deliver player names only
db.regs.aggregate([
  { $unwind: "$players" },
  { $project: { _id: 0, name: "$players.name" } }
])


// filter for female players and deliver their names only
db.regs.aggregate([
  { $unwind: "$players" },
  { $match: { "players.sex": "F" } },
  { $project: { _id: 0, name: "$players.name" } }
])


// Array of names
db.regs.aggregate([
  { $unwind: "$players" },
  { $group: { _id: null, names: { $push: "$players.name" } } },
  { $project: { _id: 0, names: 1 } }
])