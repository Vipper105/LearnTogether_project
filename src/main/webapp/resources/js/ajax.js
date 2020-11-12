/**
 * @author NguyenDoanNam
 *
 */
/*------------------------------category-------------------------------*/

		$('table .edit').on('click', function() {
			var id = $(this).parent().find('#id').val();
			$.ajax({
				type : 'GET',
				dataType: 'json',
				url : "<%=contextPath%>/admin/category/" + id,
				success : function(data) {
					$("#idCategory").val(data.id);
					$("#categoryName").val(data.categoryName);

				}
			});
		});









