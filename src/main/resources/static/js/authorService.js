export async function getAuthor() {
  const addCourseUrl = "http://localhost:8080/lms/courses/all"
  const res = await fetch(addCourseUrl)
  const data = await res.json()

  const authorData = data.data.map(course => ({
    author: course.author
  }))
  
  return authorData
}
