const getEnrollmentsUrl = "https://v0-simple-lms-system-eight.vercel.app/api/enrollments";
const getCouseUrl_raw = "https://v0-simple-lms-system-eight.vercel.app/api/courses/"
const userId = localStorage.getItem("userId")
console.log(userId)
getCourseEnrolled()
async function getEnrolledIds() {
  const res = await fetch(getEnrollmentsUrl + '?studentId=' + userId)
  console.log(getEnrollmentsUrl + '?studentId=' + userId)
  const data = await res.json()
  const courseIds = data.data.map(row => row.courseId)
  return courseIds
}
async function getCourseEnrolled() {
  const courseIds = await getEnrolledIds()
  console.log(courseIds)
  courseIds.forEach(id => executeOneCourse(id))
}
async function executeOneCourse(id) {
  const data = await getCourseInfo(id)
  addCourseCard(data)
}
async function getCourseInfo(courseId) {
  const getCourseUrl = getCouseUrl_raw + courseId
  const res = await fetch(getCourseUrl)
  const courseData = await res.json()
  console.log(courseData)
  return courseData
}
async function addCourseCard(data) {
  const courseId = data.data.id

  const getAssignmentUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + courseId + "/assignments"
  const getMaterialUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + courseId + "/materials"
  const resMeterial = await fetch(getMaterialUrl)
  const dataMaterial = await resMeterial.json();
  const resAss = await fetch(getAssignmentUrl)
  const dataAss = await resAss.json();

  const element =
    `<div class="card col-3 px-0">
                <img style="width: 100%; aspect-ratio: 16 / 9; object-fit: cover;" class="rounded-1" src="https://v0-simple-lms-system-eight.vercel.app/placeholder.svg?height=200&width=400" />
                    <div class="px-3 d-flex flex-column">
                        <span class="card-title p-2 fw-bold">${data.data.title}</span>
                        <span class="card-text px-2">${data.data.description}</span>
                        <div class="d-flex align-items-center px-2">
                            <i class="fas fa-user pe-1"></i>
                            <span>${data.data.enrolled} Students</span>
                        </div>
                        <div class="d-flex justify-content-start align-items-center px-2">
                            <div class="pe-2">
                                <i class="fas fa-file-alt"></i> ${dataAss.data.length} assignments
                            </div>
                            <div>
                                <i class="fas fa-book"></i> ${dataMaterial.data.length} materials
                            </div>
                        </div>
                        <button class="border border-dark my-2 rounded-1 btn-dark py-1">
                            <a style="text-decoration: none; color: white" href="user_CD.html?courseId=${courseId}">View course</a>    
                        </button>
                    </div>
                </div>`
  document.getElementById('courses').innerHTML += element
}
fetch('navbar-user.html')
  .then(res => res.text())
  .then(html => document.getElementById('navbar').innerHTML = html);