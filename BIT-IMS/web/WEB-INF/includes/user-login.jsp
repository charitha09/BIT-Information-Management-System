<section id="user-login">
	<div id="login-box" class="modal fade" role="dialog">
	  <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			  <h4 class="modal-title">Login to System</h4>
			</div>
			<form name="user-login" action="index.jsp" method="POST">
				<div class="modal-body">
					<div class="form-group">
						<label for="email">Email address:</label>
						<input type="email" class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label>
						<input type="password" class="form-control" id="pwd">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				</div>
			</form>
		</div>
	</div>
</section>