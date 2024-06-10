const express = require('express')
const app = express()

const calender = require('./data/calender.json')
const login = require('./data/login.json')
const players = require('./data/players.json')
const teams = require('./data/teams.json')

app.get('/rest/login', (req, res) => res.json(login))
app.get('/rest/calendar', (req, res) => res.json(calender))
app.get('/rest/teams', (req, res) => res.json(teams))
app.get('/rest/players', (req, res) => res.json(players))


app.listen(3000, () => console.log('Server started on port 3000'))
