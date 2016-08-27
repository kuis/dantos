json.files [@photo] do |photo|
  json.url photo.data.url
  json.deleteUrl photo_path(photo, format: :json)
  json.deleteType "DELETE"
end

# {"files": [
#   {
#     "name": "picture1.jpg",
#     "size": 902604,
#     "url": "http:\/\/example.org\/files\/picture1.jpg",
#     "thumbnailUrl": "http:\/\/example.org\/files\/thumbnail\/picture1.jpg",
#     "deleteUrl": "http:\/\/example.org\/files\/picture1.jpg",
#     "deleteType": "DELETE"
#   },
#   {
#     "name": "picture2.jpg",
#     "size": 841946,
#     "url": "http:\/\/example.org\/files\/picture2.jpg",
#     "thumbnailUrl": "http:\/\/example.org\/files\/thumbnail\/picture2.jpg",
#     "deleteUrl": "http:\/\/example.org\/files\/picture2.jpg",
#     "deleteType": "DELETE"
#   }
# ]}