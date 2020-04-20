<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="well"><span style="font-size:xx-large;">Have any Question ? </span>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="float:right;border:2px solid black;">Ask Question</button>
</div>
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
            <h4 class="modal-title">Ask Question</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
	  <form method="post" action="addquestion.pforum">
			<div class="form-group">
			  <label for="sel1">Select Category:</label>
			  <select class="form-control" id="sel1" name="categories">
				<option value="technical">Technical</option>
				<option value="code">Code</option>
				<option value="onboarding">OnBoarding</option>
				<option value="payroll">Payroll</option>
				<option value="policies">Policies</option>
			  </select>
			</div>
			<div class="form-group">
			 <textarea class="form-control" rows="5" id="comment" name="question" placeholder="Enter Question..."></textarea>
			</div>
			<button type="submit" class="btn btn-primary btn-lg">Post Question</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>