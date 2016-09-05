$el =  $("#messages")

ChatWindow =
  onLoadMore: ->

  onScroll: ->
    if $el.scrollTop < 100
      @onLoadMore()

  handleResize: ->
    console.log('height', $el.scrollHeight)
    console.log('top', $el.scrollTop)

  initialize: ->
    $el.on("scroll", @onScroll)
    # window.addEventListener('mousewheel', this.handleResize.bind(this))
    $el.scrollTop = $el.scrollHeight

  update: ->
    @shouldScrollBottom = ($el.scrollTop + $el.offsetHeight) == $el.scrollHeight

  componentDidUpdate: ->
    if @shouldScrollBottom
      $el.scrollTop = $el.scrollHeight
