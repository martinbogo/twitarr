Twitarr.StreamPost = Ember.Object.extend
  id: null
  author: null
  text: null
  timestamp: null
  photo: null

  pretty_timestamp: (->
    moment(@get('timestamp')).fromNow(true)
  ).property('timestamp')

  photo_path: (->
    Twitarr.StreamPost.photo_path @get('photo')
  ).property('photo')


Twitarr.StreamPost.reopenClass
  page: (page) ->
    $.getJSON("stream/#{page}").then (data) =>
      list = Ember.A()
      list.pushObject(@create(post)) for post in data.stream_posts
      { posts: list, next_page: data.next_page }

  new_post: (text, photo) ->
    $.post('stream', text: text, photo: photo).then (data) =>
      data.stream_post = Twitarr.StreamPost.create(data.stream_post) if data.stream_post?
      data

  photo_path: (photo) ->
    "/photo/small_thumb/#{photo}"
