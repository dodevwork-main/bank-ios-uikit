const express = require('express')
const app = express()

app.get('/rest/login', (req, res) => {
    res.json({
        "id": "123",
        "name": "Иван",
        "lastName": "Иванов",
        "phoneNumber": "79153488723",
        "email": "test@mail.ru"
    })
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});