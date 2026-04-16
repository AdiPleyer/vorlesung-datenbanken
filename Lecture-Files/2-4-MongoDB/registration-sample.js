m1 = {
	team: { name: "TSG Frankfurt", contact: "Hans", email: "hans@hans.org"},
	regdate: "2012/07/29",
	players: [
		{ pid: 0, name: "Hilde", 			minclass: "A", sex: "F" },
		{ pid: 1, name: "Wolfi", 			minclass: "B", sex: "M" },
		{ pid: 2, name: "Albert", 		minclass: "B", sex: "M" },
		{ pid: 3, name: "Garfield", 		minclass: "A", sex: "M", otherteam: "TSG Giessen"},
		{ pid: 4, name: "Wanda", 		minclass: "B", sex: "F" }
	],
	registrations: [
		{ player1: 0, player2: 4,	discipline: "WD", class: "A" },
		{ player1: 1, player2: 2,	discipline: "MD", class: "B" },
		{ player1: 3,             		discipline: "MS", class: "A" },
		{ player1: 3, player2: 4,	discipline: "MX", class: "A" },
		{ player1: 0,             		discipline: "WS", class: "A" },
		{ player1: 1,             		discipline: "MS", class: "A" }
	]
}
