jQuery ->
  if $('#sortableAnnouncement').length > 0
    table_width = $('#sortableAnnouncement').width()
    cells = $('.table').find('tr')[0].cells.length
    desired_width = table_width / cells + 'px'
    $('.table td').css('width', desired_width)

    $('#sortableAnnouncement').sortable(
      axis: 'y'
      items: '.item'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        # highlight the row on drop to indicate an update
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
        console.log(item_id, position)
        $.ajax(
          type: 'POST'
          url: '/announcements/update_row_order'
          dataType: 'json'
          data: { announcement: {announcement_id: item_id, row_order_position: position } }
        )
    )