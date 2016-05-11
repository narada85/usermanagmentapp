#= require active_admin/base


show_image_preview = (fileInput) ->
  files = fileInput.files
  i = 0

  while i < files.length
    file = files[i]
    imageType = /image.*/
    continue  unless file.type.match(imageType)
    img = document.getElementById("img-preview")
    img.file = file
    reader = new FileReader()
    reader.onload = ((aImg) ->
      (e) ->
        aImg.src = e.target.result
        return
    )(img)
    reader.readAsDataURL file
    i++
  return

window.show_image_preview = show_image_preview