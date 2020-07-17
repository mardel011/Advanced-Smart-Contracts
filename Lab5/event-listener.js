// Inject environemnt variable in this file
require("dotenv").config("./env");

// Import Web3
const Web3 = require("web3");

// Import abi
const abi = require("./__Colours_sol_Colours.json");

// create web3 instance
const web3 = new Web3(
  new Web3.providers.WebsocketProvider(process.env.WEBSOCKET_URI)
);
  
  // add account to wallet
  web3.eth.accounts.wallet.add("0x" + process.env.PRIVATE_KEY);
  
  // get contract instance
  const simplestorageContract = new web3.eth.Contract(
    abi,
    process.env.CONTRACT_ADDRESS
  );

  simplestorageContract.events
  .ColourAdded((error, event) => {
    console.log(event);
  })
  .on("data", function (event) {
    console.log(event); // same results as the optional callback above
  })
  .on("changed", function (event) {
    // remove event from local database
  })
  .on("error", console.error);