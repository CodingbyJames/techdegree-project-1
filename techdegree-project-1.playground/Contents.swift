// Create Players as a dictionary of string to any so that I can have multiple value types.
let playerJoeSmith: [String:Any] = ["Name": "Joe Smith", "Height": 42.0, "Experienced": true, "Guardian Name(s)": "Jim and Jan Smith"]
let playerJillTanner: [String:Any] = ["Name": "Jill Tanner", "Height": 36.0, "Experienced": true, "Guardian Name(s)": "Ciara Tanner"]
let playerBillBon: [String:Any] = ["Name": "Bill Bon", "Height": 43.0, "Experienced": true, "Guardian Name(s)": "Sara and Jenny Bon"]
let playerEvaGordon: [String:Any] = ["Name": "Eva Gordon", "Height": 45.0, "Experienced": false, "Guardian Name(s)": "Wendy and Mike Gordon"]
let playerMattGill: [String:Any] = ["Name": "Matt Gill", "Height": 40.0, "Experienced": false, "Guardian Name(s)": "Charles and Sylvia Gill"]
let playerKimmyStein: [String:Any] = ["Name": "Kimmy Stein", "Height": 41.0, "Experienced": false, "Guardian Name(s)": "Bill and Hillary Stein"]
let playerSammyAdams: [String:Any] = ["Name": "Sammy Adams", "Height": 45.0, "Experienced": false, "Guardian Name(s)": "Jeff Adams"]
let playerKarlSaygan: [String:Any] = ["Name": "Karl Saygan", "Height": 42.0, "Experienced": true, "Guardian Name(s)": "Heather Bledsoe"]
let playerSuzaneGreenberg: [String:Any] = ["Name": "Suzane Greenberg", "Height": 44.0, "Experienced": true, "Guardian Name(s)": "Henrietta Dumas"]
let playerSalDall: [String:Any] = ["Name": "Sall Dall", "Height": 41.0, "Experienced": false, "Guardian Name(s)": "Gala Dall"]
let playerJoeKavalier: [String:Any] = ["Name": "Joe Kavalier", "Height": 39.0, "Experienced": false, "Guardian Name(s)": "Sam and Elaine Kavalier"]
let playerBenFinkelstein: [String:Any] = ["Name": "Ben Finkelstein", "Height": 44.0, "Experienced": false, "Guardian Name(s)": "Aaron and Jill Finkelstein"]
let playerDiegoSoto: [String:Any] = ["Name": "Joe Smith", "Height": 41.0, "Experienced": true, "Guardian Name(s)": "Robin and Sarika Soto"]
let playerChloeAlaska: [String:Any] = ["Name": "Chloe Alaska", "Height": 47.0, "Experienced": false, "Guardian Name(s)": "David and Jamie Alaska"]
let playerArnoldWillis: [String:Any] = ["Name": "Arnold Willis", "Height": 43.0, "Experienced": false, "Guardian Name(s)": "Claire Willis"]
let playerPhillipHelm: [String:Any] = ["Name": "Phillip Helm", "Height": 44.0, "Experienced": true, "Guardian Name(s)": "Thomas Helm and Eva Jones"]
let playerLesClay: [String:Any] = ["Name": "Les Clay", "Height": 42.0, "Experienced": true, "Guardian Name(s)": "Wynonna Brown"]
let playerHerschelKrustofski: [String:Any] = ["Name": "Herschel Krustofski", "Height": 45.0, "Experienced": true, "Guardian Name(s)": "Hyman and Rachel Krustofski"]

// Create players collection
var players = [playerJoeSmith, playerJillTanner, playerBillBon, playerEvaGordon, playerMattGill, playerKimmyStein, playerSammyAdams, playerKarlSaygan, playerSuzaneGreenberg, playerSalDall, playerJoeKavalier, playerBenFinkelstein, playerDiegoSoto, playerChloeAlaska, playerArnoldWillis, playerPhillipHelm, playerLesClay, playerHerschelKrustofski]

// Create empty team collections and 2 groups "experiencedGroup" and "notExperiencedGroup for sorting the players before putting them into teams"
var teamSharks: [[String : Any]] = []
var teamDragons: [[String : Any]] = []
var teamRaptors: [[String : Any]] = []
var experiencedGroup: [[String : Any]] = []
var notExperiencedGroup: [[String : Any]] = []

//Assigned teams to an array called "teams" so that I don't use magic numbers for logic when divying up the experienced/inexperienced players (in this case there are three teams of 6, but what if it was four teams of 10... etc)
var teams = [teamSharks, teamDragons, teamRaptors]


// Logic to loop through the leaguePlayers and find experienced vs. Inexperienced
for player in players {
    // If loop time to check experience level
    if (player["Experienced"] as? Bool) == true {
        experiencedGroup.append(player)
    }
    else {
        notExperiencedGroup.append(player)
    }
}
//in order to stay balanced, total experienced players on each team is number of experienced players divided by number of teams
// added logic for if there aren't a perfect number of experienced per team how to deal with the extras
var experiencedPerTeam = 0
var extraExperiencedPlayers = 0
if (experiencedGroup.count%teams.count == 0){
    experiencedPerTeam = experiencedGroup.count/teams.count
} else {
    experiencedPerTeam = experiencedGroup.count/teams.count
    extraExperiencedPlayers = experiencedGroup.count%teams.count
}


//for loop going through all players and setting them into teams based on the number of experienced players necessary for balance (if logic evaluates to (0 < 3), (1 < 3)... and will put 3 players in each team.
//cast the PerTeam as int so that if it wasnt an even number it will round down to fix any errors
for player in experiencedGroup {
    if (teamRaptors.count < Int(experiencedPerTeam)) {
        teamRaptors.append(player)
    }
    else if (teamDragons.count < Int(experiencedPerTeam)) {
        teamDragons.append(player)
    }
    else if (teamSharks.count < Int(experiencedPerTeam)){
        teamSharks.append(player)
    }
    else {
        //now we deal with extra players if we have any
        if (extraExperiencedPlayers != 0) {
            if ((teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count)) {
                teamRaptors.append(player)
            }
            else if (teamDragons.count <= teamSharks.count) {
                teamDragons.append(player)
            }
            else {
                print("all players have been added to teams")
            }
        }
        else {
            print("all players have been added to teams")
        }
    }
    
}
//Finding out how many players should be on each team (to avoid using magic numbers)
//this number may end up being a double if there aren't a perfectly divisible number of players but the logic checks out just fine
var totalPlayersOnTeam = players.count/teams.count

//Final logic adding rest of players (inexperienced) to teams until team is full (number of players/number of teams) again to avoid magic numbers.
//had to add logic here at the end as well to avoid weird interactions if players weren't perfectly divisible by the number of teams
for player in notExperiencedGroup {
    if (teamRaptors.count < Int(totalPlayersOnTeam)) {
        teamRaptors.append(player)
    }
    else if (teamDragons.count < Int(totalPlayersOnTeam)) {
        teamDragons.append(player)
    }
    else if teamSharks.count < Int(totalPlayersOnTeam) {
        teamSharks.append(player)
    }
        //here is the logic to deal with extra inexperienced players
    else {
        if ((teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count)) {
            teamRaptors.append(player)
        }
        else if (teamDragons.count <= teamSharks.count) {
            teamDragons.append(player)
        }
        else {
            print("all players have been added")
        }
    }
    
}

//empty array of strings for letters
var letters: [String]  = []


//ran a for loop for each team to create a letter for each player and append them to the empty letters array
for player in teamSharks {
    //used if let to unwrap the optionals to new variables, with an else to catch errors
    if let parents = player["Guardian Name(s)"],let child = player["Name"] {
        let letter = "Hello \(parents). Your child, \(child) has been placed on team Sharks. Please make sure they attend practice on March 17th at 3PM. Thank you!"
        letters.append(letter)
    } else {
        print("An error occured")
    }
    
}
for player in teamDragons {
    if let parents = player["Guardian Name(s)"],let child = player["Name"] {
        let letter = "Hello \(parents). Your child, \(child) has been placed on team Dragons. Please make sure they attend practice on March 17th at 1PM. Thank you!"
        letters.append(letter)
    } else {
        print("An error occured")
    }
    
}
for player in teamRaptors {
    if let parents = player["Guardian Name(s)"],let child = player["Name"] {
        let letter = "Hello \(parents). Your child, \(child) has been placed on team Raptors. Please make sure they attend practice on March 18th at 1PM. Thank you!"
        letters.append(letter)
    } else {
        print("An error occured")
    }
    
    
}


//printing letters out as strings instead of just dumping the array out, used an empty string to make it look neater and more readable in the console.
for letter in letters {
    print(letter)
    print("")
}


