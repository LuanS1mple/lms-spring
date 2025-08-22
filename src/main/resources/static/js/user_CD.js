const userId = localStorage.getItem("userId")
const token = localStorage.getItem("token")
console.log(userId)
async function submitAssignment(e) {
  const fileInfo = await openFileDialogAndGetInfo()
  const userData = await getUserData()
  console.log(fileInfo)
  console.log(userData)
  const bodyJson = {
    studentId: userData.id,
    studentName: userData.name,
    studentEmail: userData.email,
    fileName: fileInfo.fileName,
    fileUrl: fileInfo.fileUrl,
    fileSize: fileInfo.fileSize.toString()
  };
  const submitUrl = "https://v0-simple-lms-system-eight.vercel.app/api/assignments/" + e.value + "/submissions"
  const res = await fetch(submitUrl, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${token}`
    },
    body: JSON.stringify(bodyJson)
  })
  if (res.ok) {
    alert("Submit success")
  }
  else {
    alert('Submit failed')
  }
}
async function getUserData() {
  const userUrl = "https://v0-simple-lms-system-eight.vercel.app/api/users/" + userId
  const res = await fetch(userUrl, {
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${token}`
    }
  })
  const data = await res.json();
  return data
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

      const fileName = file.name;
      const fileSize = file.size;
      const fileUrl = URL.createObjectURL(file);

      resolve({
        fileName,
        fileSize,
        fileUrl
      });
    };

    input.click();
  });
}


const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const courseId = urlParams.get('courseId');
console.log("Course ID:", courseId);

fetch('navbar-user.html')
  .then(res => res.text())
  .then(html => document.getElementById('navbar').innerHTML = html);
var getCourseUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + courseId
var getMaterialCourseUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + courseId + "/materials"
var getTestCourseUrl = "https://v0-simple-lms-system-eight.vercel.app/api/courses/" + courseId + "/assignments"
async function getDataAssignments() {
  const res = await fetch(getTestCourseUrl)
  const data = await res.json()
  return data
}
async function addElementAssignment() {
  const dataAssignment = await getDataAssignments();
  console.log(dataAssignment.data.length);
  dataAssignment.data.forEach(row => {
    const assId = row.id

    let elementAssignment =
      ` <div class="border rounded d-flex flex-column p-3 mt-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-column gap-3">
                                <div>
                                    <h6 class="fw-bold mb-0">${row.title}</h6>
                                    <span class="text-muted">${row.description}</span><br>
                                </div>
                                <small class="text-muted mt-3">
                                    <i class="bi bi-calendar-event"></i> Due: ${row.dueDate}
                                </small>
                            </div>

                           <div class="text-end d-flex flex-column gap-3">
                                <div class="mb-2">
                                    <button value="${row.id}" style="height: 30px;"
                                        onclick="submitAssignment(this)" class="badge bg-light text-dark border">Submit
                                        result</button>
                                </div>
                            </div>
                        </div>
                    </div>`
    document.getElementById('assignments').innerHTML += elementAssignment

  })

}
addElementAssignment()
getCourseInfo()
async function getDataMaterial() {
  const res = await fetch(getMaterialCourseUrl);
  const data = await res.json();
  return data;
}

async function addElementMaterial() {
  const dataMaterial = await getDataMaterial();
  console.log(dataMaterial.data.length);
  dataMaterial.data.forEach(row => {
    let elementMaterial =
      `<div class="d-flex justify-content-between align-items-center border rounded p-2 mb-2">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-file-earmark-text fs-4 text-secondary me-2"></i>
                            <div>
                                <div>${row.name}</div>
                                <small class="text-muted">Uploaded on ${row.uploadedAt} • ${row.size}</small>
                            </div>
                        </div>
                        <button class="btn btn-outline-secondary btn-sm">
                            <i class="bi bi-download me-1"></i> Download
                        </button>
                    </div>`
    document.getElementById('materials').innerHTML += elementMaterial

  })

}
addElementMaterial()
function getCourseInfo() {
  fetch(getCourseUrl, {
    method: 'GET',

  })
    .then(res => res.json())
    .then(addElemnetCourseInfo)
}
async function addElemnetCourseInfo(data) {
  const dataMaterial = await getDataMaterial();
  const dataAss = await getDataAssignments();
  document.getElementById('heading').innerHTML = data.data.title
  document.getElementById('heading-title').innerHTML = data.data.description
  document.getElementById('siso').innerHTML = data.data.enrolled
  document.getElementById('baitap').innerHTML = dataAss.data.length
  document.getElementById('tailieu').innerHTML = dataAss.data.length

  const element =
    `<p class="fw-bold fs-4">${data.data.title}</p>
                    <p>
                        ${data.data.description}
                    </p>

                    <div class="row" style="font-size: small;">
                        <div class="col-6">
                            <p class="mb-1 fw-semibold">Course Information</p>
                                <div class="d-flex justify-content-between"><span>Instructor:</span> <span>${data.data.teacher}</span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Enrolled Students:</span> <span>${data.data.enrolled}</span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Max Capacity:</span> <span>${data.data.maxStudents}</span></div>
                        </div>
                        <div class="col-6">
                            <p class="mb-1 fw-semibold">Quick Stats</p>
                            <div class="d-flex justify-content-between"><span>Total Materials:</span> <span>${dataMaterial.data.length}</span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Total Assignments:</span> <span>${dataAss.data.length}</span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Completed:</span> <span></span></div>
                        </div>
                    </div>`
  document.getElementById('overview').innerHTML += element
}