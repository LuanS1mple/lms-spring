document.querySelector('form').addEventListener("submit", e => {
  e.preventDefault()
})
const url = window.location.href;
const parts = url.split('/');
const courseId = parts[parts.length - 1];
//const token = localStorage.getItem("token")
console.log("Course ID:", courseId);
const uploadAssignmentUrl = "http://localhost:8080/lms/courses/" + courseId + "/course-test"
async function uploadAssignment() {
  const title = document.getElementById("title").value;
  const description = document.getElementById("description").value;
  const duration = parseInt(document.getElementById("duration").value);
  const maxPoints = parseInt(document.getElementById("maxPoints").value);
  const fileInput = document.getElementById('file');
  const file = fileInput.files?.[0];
  if (!file) {
    console.log("Không có file nào được chọn");
    return;
  }
  const fileUrl = URL.createObjectURL(file);
  console.log("URL tạm:", fileUrl);
  const body = {
    "testTitle": title,
    "testDescription": description,
    "duration": duration,
    "maxScore": maxPoints,
    "testUrl": fileUrl
  }

  const res = await fetch(uploadAssignmentUrl, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })
  const data = await res.json()
  console.log(data)
  alert(data.message)
  window.location.href = "http://localhost:8080/lms/admin-cd?courseId=" + courseId
}
