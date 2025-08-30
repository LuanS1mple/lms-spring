//const token = localStorage.getItem('token')
const getCoursesUrl = "http://localhost:8080/lms/courses/all"
const reloadUrl = "http://localhost:8080/lms/admin-cm"


function refillCourse(){
    const value = document.getElementById("searchBox").value;
    document.getElementById('add').innerHTML = "";
    if(value.trim() == null || value.trim()===""){
        getAllCourse()
    }
    else{
        getCourseSearch(value)
    }
}

async function saveCourseChanges(e) {
  e.preventDefault()
  const form = e.target;

  const id = form.querySelector("[name='id']").value;
  const title = form.querySelector("[name='title']").value;
  const description = form.querySelector("[name='description']").value;
  const author = form.querySelector("[name='author']").value;
  const category = form.querySelector("[name='category']").value;
  const level = form.querySelector("[name='level']").value;
  const duration = parseInt(form.querySelector("[name='duration']").value,10);
  const putCourseUrl = "http://localhost:8080/lms/courses/" + id

  const body = {
    title,
    description,
    author,
    category,
    level,
    duration: duration
  };
  console.log(body)
  const res = await fetch(putCourseUrl, {
    method: 'PUT',
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })
  const data = await res.json();
  if(data.data){
    alert(data.message)
    window.location.href = reloadUrl;
  }
  else{
    alert(data.message)
  }
}
document.addEventListener("click", function (e) {
  if (e.target.closest(".edit")) {
    const btn = e.target.closest(".edit");
    const form = document.getElementById("editCourseForm");

    form.querySelector("[name='id']").value = btn.dataset.id;
    form.querySelector("[name='title']").value = btn.dataset.title;
    form.querySelector("[name='description']").value = btn.dataset.description;
    form.querySelector("[name='author']").value = btn.dataset.author;
    form.querySelector("[name='category']").value = btn.dataset.category;
    form.querySelector("[name='level']").value = btn.dataset.level;
    form.querySelector("[name='duration']").value = parseInt(btn.dataset.duration);
  }
});

function createCourse(e) {
  e.preventDefault()
  const form = document.getElementById("createCourseForm");

  const title = form.querySelector("[name='title']").value;
  const description = form.querySelector("[name='description']").value;

  const select = form.querySelector("[name='author']");
  const teacherName = select.options[select.selectedIndex].text;

  const category = form.querySelector("[name='category']").value;
  const difficulty = form.querySelector("[name='difficulty']").value;
  const duration = parseInt(form.querySelector("[name='duration']").value, 10);

  const body = {
    title: title,
    description: description,
    author: teacherName,
    category: category,
    level: difficulty,
    duration: duration,
  };
  console.log(body)
  const addCourseUrl = "http://localhost:8080/lms/courses/add"
  fetch(addCourseUrl, {
    method: 'POST',
    headers:
    {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })
    .then(res => {
      return res.json();
    })
    .then(data => {
        alert(data.message)
        window.location.href = reloadUrl;
    })
    .catch(err => console.error("Error:", err));
}


getAllCourse()
function getAllCourse() {
  fetch(getCoursesUrl)
    .then(res => res.json())
    .then(showCourses)
}
function getCourseSearch(name) {
    const courseSearchUrl = 'http://localhost:8080/lms/courses/all/search?name='+name
    fetch(courseSearchUrl)
    .then(res => res.json())
    .then(showCourses)
}
function showCourses(data) {
    document.getElementById("totalCourses").textContent = data.data.totalCourse;
    document.getElementById("activeCourses").textContent = data.data.activeCourse;
    document.getElementById("totalEnrolled").textContent = data.data.totalEnroll;
  console.log(data)
  data.data.courses.forEach(row => {
    const element =
      `<tr>
            <td>
              <strong>
                <a style="text-decoration: none; color: black" href="http://localhost:8080/lms/admin-cd?courseId=${row.id}">${row.title}</a>
              </strong>
              <p>${row.description}</p>
            </td>
            <td>${row.author}</td>
            <td><span class="badge active">${row.status}</span></td>
            <td>${row.createdAt}</td>
            <td class="actions">
              <button class="edit"
                      data-id="${row.id}"
                      data-title="${row.title}"
                      data-description="${row.description}" 
                      data-category="${row.category}"
                      data-author="${row.author}"
                      data-level="${row.level}"
                      data-duration="${parseInt(row.duration)}" 
                      data-bs-toggle="modal"
                      data-bs-target="#editCourseModal">
                <i class="fas fa-edit"></i>
              </button>
              <button value="${row.id}" onclick="deleteCourse(this)" class="delete"><i class="fas fa-trash"></i></button>
            </td>
          </tr>`
    document.getElementById('add').innerHTML += element
  })
}
async function deleteCourse(e) {
  courseId = e.value
  const deleteCourseUrl = 'http://localhost:8080/lms/courses/' + courseId
  const res = await fetch(deleteCourseUrl, {
    method: 'DELETE',
    headers: {
      "Content-Type": "application/json",
    }
  })
  const data = await res.json()
  alert(data.message)
  window.location.href = reloadUrl
}