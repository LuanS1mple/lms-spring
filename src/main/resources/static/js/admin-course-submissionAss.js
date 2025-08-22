// Lấy toàn bộ query string từ URL, ví dụ: ?courseId=123"
const queryString = window.location.search;
// Dùng URLSearchParams để xử lý query string
const urlParams = new URLSearchParams(queryString);
// Lấy giá trị của biến courseId
const assignmentId = urlParams.get('assignmentId');
const dueDate = urlParams.get('due');
document.getElementById('due').innerHTML = 'Due: ' + dueDate

const getSumissionUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + assignmentId + "/assignments"
addAllElementSubmission()
async function getAllSubmissions() {
  const res = await fetch(getSumissionUrl)
  const data = await res.json()
  return data
}
async function addAllElementSubmission() {
  const data = await getAllSubmissions()
  document.getElementById('number').innerHTML = data.data.length + ' submissions'
  data.data.forEach(row => addOneElement(row))
}
async function addOneElement(submission) {
  const userData = await getUserData(row.studentId)
  const element =
    `<div style="border: none; border: 1px solid #ddd; padding: 20px; border-radius: 10px;">
                    <div class="d-flex flex-row justify-content-between">
                        <div class="d-flex flex-column">
                            <p class="m-0">
                                <i class="bi bi-person"></i>
                                <span class="fw-bold">${userData.name}</span>
                            </p>
                            <p>${userData.email}</p>
                        </div>
                        <div class="d-flex align-items-center align-items-center"
                            style="height:30px;background-color: black; color: white; border-radius: 50%;"> ${submission.status}
                        </div>
                    </div>
                    <div class="d-flex row">
                        <div class="col-6 d-flex justify-content-start flex-column">
                            <p class="my-0 fw-semibold fs-6">Submitted File</p>
                            <p class="my-0" style="font-size: small;">
                                <i class="bi bi-file-earmark"></i> ${submission.fileName}
                                <span class="text-muted">(2.1 MB)</span>
                            </p>
                        </div>
                        <div class="col-6 d-flex justify-content-start flex-column">
                            <p class="my-0 fw-semibold fs-6">Submission Time</p>
                            <p class="my-0" style="font-size: small;">
                                <i class="bi bi-clock"></i> ${submission.submittedAt}
                            </p>

                        </div>
                    </div>
                    <hr />
                    <div class="d-flex flex-column gap-2">
                        <p class="fw-semibold" style="font-size: large;">
                            Grading
                        </p>
                        <div class="d-flex flex-column gap-2">
                            <label class="fw-semibold">Grade</label>
                            <input value="${submission.points}"/>
                        </div>
                        <div class="d-flex flex-column gap-2">
                            <label class="fw-semibold">Feedback</label>
                            <textarea value="${submission.feedback}">

                        </textarea>
                        </div>
                        <button class="btn btn-secondary" style="background-color: #888; border: none; width: 100px;">
                            Updated
                        </button>

                    </div>
                </div>`
  document.getElementById('all-submission').innerHTML += element
}
const token = localStorage.getItem("token")
async function getUserData(userId) {
  const getUserUrl = "https://v0-simple-lms-system-eight.vercel.app/api/users/" + userId
  const res = await fetch(getUserUrl, {
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${token}`
    }
  })
  const data = await res.json()
  return data
}
console.log("assignmentId:", assignmentId);
fetch('navbar-user.html')
  .then(res => res.text())
  .then(html => document.getElementById('navbar').innerHTML = html);