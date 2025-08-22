//const registerUrl = "http://localhost:8080/lms/register";
//async function register(e) {
//  e.preventDefault()
//
//  const fullname = document.getElementById("fullname").value.trim();
//  const email = document.getElementById("email").value.trim();
//  const password = document.getElementById("password").value.trim();
//  const role = document.getElementById("role").value;
//
//  const body = {
//    name: fullname,
//    email: email,
//    password: password,
//    role: role
//  };
//  const res = await fetch(registerUrl, {
//    method: 'POST',
//    body: JSON.stringify(body)
//  })
//  if (res.ok) {
//    alert("Đăng kí thành công")
//  }
//  else {
//    alert("Đăng kí thất bại")
//  }
//}
