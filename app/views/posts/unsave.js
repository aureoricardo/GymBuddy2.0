const btn = document.getElementById("save-btn-<%= @post.id %>");
if (btn) {
  btn.textContent = "💾 Save";
  btn.closest('form').setAttribute('action', "<%= save_post_path(@post) %>");
  btn.closest('form').setAttribute('data-method', 'post');
}
