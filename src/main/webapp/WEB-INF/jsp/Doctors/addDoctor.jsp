<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <jsp:include page="../common/header.jsp"></jsp:include> 
	    <style>
	    .main-form{
	    width:80%;
	    margin-left:20.5%;
	    margin-top:10%;
	    
	    }

		</style>         
							
					<!-- Row -->
					
							<!-- Custom Boostrap Validation -->
							<div class="card main-form">
								<div class="card-header">
									<h5 class="card-title">Custom Bootstrap Form Validation</h5>
									<p class="card-text">For custom Bootstrap form validation messages, you’ll need to add the <code>novalidate</code> boolean attribute to your form. For server side validation <a href="https://getbootstrap.com/docs/4.1/components/forms/#server-side" target="_blank">read full documentation</a>.</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-sm">
											<form class="needs-validation" novalidate>
												<div class="row">
													<div class="col-md-4 mb-3">
														<label class="mb-2" for="validationCustom01">First name</label>
														<input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" required>
														<div class="valid-feedback">
															Looks good!
														</div>
													</div>
													<div class="col-md-4 mb-3">
														<label class="mb-2" for="validationCustom02">Last name</label>
														<input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="Otto" required>
														<div class="valid-feedback">
															Looks good!
														</div>
													</div>
													<div class="col-md-4 mb-3">
														<label class="mb-2" for="validationCustomUsername">Username</label>
														<div class="input-group">
															<span class="input-group-text" id="inputGroupPrepend">@</span>
															<input type="text" class="form-control" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" required>
															<div class="invalid-feedback">
																Please choose a username.
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 mb-3">
														<label class="mb-2" for="validationCustom03">City</label>
														<input type="text" class="form-control" id="validationCustom03" placeholder="City" required>
														<div class="invalid-feedback">
															Please provide a valid city.
														</div>
													</div>
													<div class="col-md-3 mb-3">
														<label class="mb-2" for="validationCustom04">State</label>
														<input type="text" class="form-control" id="validationCustom04" placeholder="State" required>
														<div class="invalid-feedback">
															Please provide a valid state.
														</div>
													</div>
													<div class="col-md-3 mb-3">
														<label class="mb-2" for="validationCustom05">Zip</label>
														<input type="text" class="form-control" id="validationCustom05" placeholder="Zip" required>
														<div class="invalid-feedback">
															Please provide a valid zip.
														</div>
													</div>
												</div>
												<div class="mb-3">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
														<label class="form-check-label" for="invalidCheck">
															Agree to terms and conditions
														</label>
														<div class="invalid-feedback">
															You must agree before submitting.
														</div>
													</div>
												</div>
												<button class="btn btn-primary" type="submit">Submit form</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- /Custom Boostrap Validation -->
							
							