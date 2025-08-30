const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const courseId = urlParams.get('courseId');
console.log("Course ID:", courseId);
const token = localStorage.getItem("token")
const userId = localStorage.getItem("userId")

var getCourseUrl = "http://localhost:8080/lms/courses/" + courseId

async function uploadMaterial() {
  const fileInfo = await openFileDialogAndGetInfo()
  const body = {
    title: fileInfo.name,
    type: fileInfo.type,
    contentUrl: fileInfo.url,
  };
  console.log(body)
  createUrl = "http://localhost:8080/lms/courses/"+courseId+"/course-content"
  const res = await fetch(createUrl, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })
  const data =await res.json()
  console.log(data)
  alert(data.message)
  location.reload()
}
async function openFileDialogAndGetInfo() {
  return new Promise((resolve, reject) => {
    const input = document.createElement("input");
    input.type = "file";
    input.accept = "*/*";
    input.style.display = "none";

    input.onchange = () => {
      const file = input.files?.[0];
      if (!file) {
        reject("Không có file nào được chọn");
        return;
      }

      const name = file.name;
      const type = file.name.split('.').pop().toLowerCase() || 'unknown';
      const url = URL.createObjectURL(file);

      resolve({
        name,
        type,
        url
      });
    };

    input.click();
  });
}

function redirectToNewAss() {
  window.location.href = "http://localhost:8080/lms/new-course-test?courseId=" + courseId
}

async function addElementAssignment(dataAssignment) {
  dataAssignment.forEach(row => {
    const assId = row.id
    let elementAssignment =
      `<div class="border rounded d-flex flex-column p-3 mt-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-column">
                                <div>
                                    <h6 class="fw-bold mb-0">${row.testTittle}</h6>
                                    <span class="text-muted">${row.testDescription}</span><br>
                                </div>
                                <small class="text-muted mt-3">
                                    <i class="bi bi-calendar-event"></i> Duration: ${row.duration}
                                </small>
                            </div>

                            <div class="text-end d-flex flex-column gap-3">
                                <button class="btn btn-outline-secondary" style="scale: 0.9;">
                                    <a style="text-decoration: none; color: black;" href="admin-course-submissionAss.html?assignmentId=${assId}&due=${row.dueDate}">View submissions</a>
                                </button>
                            </div>
                        </div>
                    </div>`
    document.getElementById('assignments').innerHTML += elementAssignment

  })
}
getCourseInfo()

async function addElementMaterial(dataMaterial) {
  console.log(dataMaterial);
  dataMaterial.forEach(row => {
    let elementMaterial =
      `<div class="d-flex justify-content-between align-items-center border rounded p-2 mb-2">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-file-earmark-text fs-4 text-secondary me-2"></i>
                            <div>
                                <div>${row.title}</div>
                                <small class="text-muted">Uploaded on ${row.createdAt} </small>
                            </div>
                        </div>
                        <button class="btn btn-outline-secondary btn-sm">
                            <i class="bi bi-download me-1"></i> Download
                        </button>
                    </div>`
    document.getElementById('materials').innerHTML += elementMaterial

  })

}
function getCourseInfo() {
  fetch(getCourseUrl, {
    method: 'GET',

  })
    .then(res => res.json())
    .then(addElemnetCourseInfo)
}
async function addElemnetCourseInfo(data) {
  console.log(data)
  const dataMaterial =  data.data.contents;
  addElementMaterial(dataMaterial)
  const dataAss =  data.data.courseTests;
  addElementAssignment(dataAss)
  const course = data.data.course;
  document.getElementById('heading').innerHTML = course.title
  document.getElementById('heading-title').innerHTML = course.description
  document.getElementById('siso').innerHTML = 100
  document.getElementById('baitap').innerHTML = dataAss.length
  document.getElementById('tailieu').innerHTML = dataMaterial.length

  const element =
    `<p class="fw-bold fs-4">${data.data.title}</p>
                    <p>
                        ${course.description}
                    </p>
                    <div class="row" style="font-size: small;">
                        <div class="col-6">
                            <p class="mb-1 fw-semibold">Course Information</p>
                                <div class="d-flex justify-content-between"><span>Instructor:</span> <span>${course.author}</span>
                            </div>

                        </div>
                        <div class="col-6">
                            <p class="mb-1 fw-semibold">Quick Stats</p>
                            <div class="d-flex justify-content-between"><span>Total Materials:</span> <span>${dataMaterial.length}</span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Total Assignments:</span> <span>${dataAss.length}</span>
                            </div>
                        </div>
                    </div>`
  document.getElementById('overview').innerHTML += element
}