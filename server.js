const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');


const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());


import Details from '../models/Details'
const URI = "mongodb://localhost:27017/MyDetails"
mongoose
.connect(URI , {useNewURIParser: true, useUnifiedTopology: true})
.then (() => {    
    console.log("Connected to MondoDB Server")
    app.listen( port, () => {
    console.log("Server is running on port" + Port)
});
})
.catch((error) => {
    console.error('Error connecting to MongoDB:', error);
});
const Schema = mongoose.Schema;


import Details from './routes/Details'


app.use('/api', Details);




const detailSchema = new Schema({
    id: { type: Number, required: true },
    email: { type: String, required: true },
    username: { type: Number  }
    
});
const Details = mongoose.model("Details", detailSchema)

const router = express.Router()
app.use('/api', router)
//GET'/'

router.route('/')
app.use( (req,res) => {
    Details.find()
    .then((Details) => res.json(Details))
    .catch((err) => res.status(400).json("Error Happened"));

})

router.route('/:id')

router.route('/random')
.get((req,res) => {

    Details.getrandom
    var random = Math.floor(Math.random()*10)
    Details.find().skip(random).limit(1)
})

router.route('/add')
.post( (req,res) => {
    const id = req.body.id
    const email = req.body.email
    const username = req.body.username
   


    const newDetails  = new Details({
        id, email, username
    })

    newDetails
    .save()
     
    .then((details) => res.json('user details updated'))
    .catch((err) => res.status(400).json("Error Happened:" + err));

})
