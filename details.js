import Details from '../controller/details.js';

const router = require('express').Router();
import ('../models/Details')

router.route("/")
    .get((req, res) => {
        Details.find()
            .then((Details) => res.json(Details))
            .catch((err) => res.status(400).json("Error: " + err));
    });

router.route("/:id")
    .get((req, res) => {
        Details.findById(req.params.id)
            .then((Details) => res.json(Details))
            .catch((err) => res.status(400).json("Error: " + err));
    });

router.route("/add")
    .post((req, res) => {
        const id = req.body.id;
        const email = req.body.email;
        const username = req.body.username;
        
         
        const newDetails = new Details({
            id,
          email,
            username
            
        });

        newDetails
            .save()
            .then(() => res.json("New details updated!"))
            .catch((err) => res.status(400).json("Error: " + err));
    });

router.route("/update/:id")
    .put((req, res) => {
        Details.findById(req.params.id)
            .then((Details) => {
                Details.id = req.body.id;
                Details.emails = req.body.email;

               Details
                    .save()
                    .then(() => res.json("Details updated!"))
                    .catch((err) => res.status(400).json("Error: " + err));
            })
            .catch((err) => res.status(400).json("Error: " + err));
    });

router.route("/delete/:id")
    .delete((req, res) => {
        Details.findByIdAndDelete(req.params.id)
            .then(() => res.json("Selected user details deleted."))
            .catch((err) => res.status(400).json("Error: " + err));
    });

    export default router;