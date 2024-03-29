//IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES
const adminRouter = require("./routes/admin");
const authRouter = require('./routes/auth');
const productRouter = require('./routes/product');
const userRouter = require("./routes/user");

//INIT
const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://Haris:devharis55@cluster0.csoejyp.mongodb.net/?retryWrites=true&w=majority';


//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//CONNECTIONS

mongoose.connect(DB).then(() => {
    console.log("DB successfully connected");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected at port ${PORT}`);
})


