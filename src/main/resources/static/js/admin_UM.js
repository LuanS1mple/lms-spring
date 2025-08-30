//    const token = localStorage.getItem("token")


    function reloadUser(){
        const roleSearch = document.getElementById('roleSearch').value;
        const nameSearch = document.getElementById('nameSearch').value.trim();
        searchUserUrl = "http://localhost:8080/lms/users/all/search?name="+nameSearch+"&role="+roleSearch;
        window.location.href =  searchUserUrl;
    }

    function addUser() {
        const fullName = document.getElementById('addName').value;
        const email = document.getElementById('addEmail').value;
        const password = document.getElementById('addPassword').value;
        const phone = document.getElementById('addPhone').value;
        const address = document.getElementById('addAddress').value;
        const role = parseInt(document.getElementById('addRole').value);
        const avatarFile = document.getElementById('addAvatar').files[0]; // Lấy file

        let avatarUrl = "";
        if (avatarFile) {
          avatarUrl = URL.createObjectURL(avatarFile); // URL tạm trong browser
          console.log("Ảnh preview:", avatarUrl);
        }

        const body = {
          fullName,
          email,
          password,
          phone,
          address,
          role,
          avatarUrl: avatarUrl
        };
        console.log(body)
        fetch("http://localhost:8080/lms/users/add", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(body)
        })
        .then(res => res.json())
        .then(data => console.log(data))
        window.location.href = "http://localhost:8080/lms/users/all";
    }


//    function saveUserChanges() {
//      const name = document.getElementById('editName').value
//      const email = document.getElementById('editEmail').value
//      const role = document.getElementById('editRole').value
//      const userId = document.getElementById('userId').value
//      const body = {
//        "name": name,
//        "email": email,
//        "role": role
//      }
//      fetch("https://v0-simple-lms-system-eight.vercel.app/api/users/" + userId, {
//        method: 'PUT',
//        headers: {
//          "Content-Type": "application/json",
//          "Authorization": `Bearer ${token}`
//        },
//        body: JSON.stringify(body)
//      })
//        .then(res => {
//          if (res.ok) {
//            alert("Update ok")
//          }
//          else {
//            alert("Update false")
//          }
//        })
//
//    }
//
    const deleteUserUrl_raw = "http://localhost:8080/lms/users/"
    async function deleteUser(el) {
      const userId = el.value
      const deleteUserUrl = deleteUserUrl_raw + userId
      const res = await fetch(deleteUserUrl, {
        method: 'DELETE',
        headers: {
          "Content-Type": "application/json"
        },
      })
        window.location.href = "http://localhost:8080/lms/users/all";
    }
//
//    fetch('navbar_admin.html')
//      .then(res => res.text())
//      .then(html => document.getElementById('navbar_admin').innerHTML = html)
//
//    addElementUser()