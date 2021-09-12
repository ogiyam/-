// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .





// summernote
// $(document).ready(function() {
//   $('#summernote').summernote({
//   height:580,
//   fontNames:["YuGothic","Yu Gothic","Hiragino Kaku Gothic Pro","Meiryo","sans-serif","Arial","Arial Black","Comic Sans MS","Courier New","Helvetica Neue","Helvetica","Impact","Lucida Grande","Tahoma","Times New Roman","Verdana"],
//   lang:"ja-JP",
//   });
//   });


// ドラッグ＆ドロップ

$(function() {
  $('.task-list').draggable();
    $(".trash-box").droppable({
      accept: ".task-list",
      activeClass: "move-trash",
      drop: function(e, ui){
        // デフォルトの動作をキャンセル
        e.preventDefault();
        var delete_message = confirm("削除してもよろしいですか？");
        if(delete_message == true){
          //ドロップされた要素を取得 jQueryオブジェクトからDOM要素を取り出す
          var delete_todo = ui.draggable[0];
          //idを取得。
          var delete_ID = ui.draggable.data("todo: task");
          var delete_url = "/todos/:id" + delete_ID;
          $.ajax({
            url: delete_url,
            type: "POST",
            data: {id: delete_ID, "_method": "DELETE"},
            dataType: "json"
          })

          .done(function(data){
            delete_item.remove();
            location.reload();
          })
          .fail(function(){
            alert("エラー");
          })
        }
      }
    })
  });




// $(function() {
//   $('.box').draggable();
//     $('.drop_area').droppable({
//       activate: function(e,ui) {
//         $(this)
//           .find("p")
//           .html("ドラッグが開始されました");
//       },
//       over: function(e,ui) {
//         $(this)
//           .css('background', '#e0ffff')
//           .css('border', '2px solid #00bfff')
//           .find("p")
//           .html("ドロップエリアに入りました" );
//       },
//     });
//   });