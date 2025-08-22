const loginUrl = "http://localhost:8080/lms/login/authenticate";

function loadNavbar() {
  fetch('http://localhost:8080/lms/navbar')
    .then(res => res.text())
    .then(html => document.getElementById('navbar').innerHTML = html);
}

loadNavbar();

//document.getElementById("formId").addEventListener("submit", checkAccount);
//
//async function checkAccount(e) {
//  const username = document.querySelector('[name="username"]').value;
//  const password = document.querySelector('[name="password"]').value;
//  console.log(loginUrl)
//  fetch(loginUrl, {
//          method: 'POST',
//          headers: {
//         'Content-Type': 'application/json'
//         },
//         body: JSON.stringify({
//           email: username,
//            password: password
//            })
//  })
//}


