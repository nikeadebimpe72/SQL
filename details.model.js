import mongoose  from "mongoose";

const detailSchema = new mongoose.Schema({
    id: { type: Number, required: true },
    email: { type: String, required: true },
    username: { type: Number  }
    
});

const Details = mongoose.model("Details", detailSchema);

export default Details;