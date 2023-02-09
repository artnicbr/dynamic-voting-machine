import React, { useState } from "react";
import axios from "axios";
import "../../../node_modules/bootstrap/dist/css/bootstrap.min.css";
import './Login.css';

function Login() {

  const [strUser, setStrUser] = useState("");
  const [strPass, setStrPass] = useState("");

  const loginAction = () => {
    const loginData = {
      user: strUser,
      pass: strPass,
    }

    axios.post("https://localhost:8000/login", loginData)
      .then((resp) =>{
        console.log(resp);
        alert("OK");
      })
  }

  return (
    <div className="container-fluid">
      <div class="row justify-content-center">
        <div class="col-1 text-center">
          LOGIN
        </div>
        <div class="col-4">
          <div class="form-floating mb-3">
            <input type="email" class="form-control" id="loginFloatingInput" placeholder="name@example.com" />
            <label for="loginFloatingInput">Email address</label>
          </div>
        </div>
      </div>     
      <div class="row justify-content-center">
        <div class="col-1 text-center">
          SENHA
        </div>
        <div class="col-4">
          <div class="form-floating mb-3">
            <input 
              type="password" 
              class="form-control" 
              id="passFloatingInput" 
              placeholder="name@example.com" 
            />
            <label for="passFloatingInput">Password</label>
          </div>
        </div>
      </div>  
      <div class="row justify-content-center">
        <div class="col-5 text-right">
          <button type="button" class="btn btn-outline-dark" onClick={loginAction}>Entrar</button>
        </div>
      </div>        
    </div>
  );
}

export default Login;
