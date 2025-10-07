import express from "express";
import {fetch, create, update, deleteUser } from "./Controller/details.js";
const route = express.Router();

route.post("/create",create);
route.get("/fetch", fetch);
route.get("/getAllUsers", fetch);
route.put("/update/:id", update);
route.delete("/delete/:id", deleteUser);

export default route;
