<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="modal fade" id="detail-member-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="detail-user container d-flex justify-content-center align-items-center p-0"
                style="border-radius:10px;">
                <div class="card text-black">
                    <div class="modal-header border-0 m-0">
                        <button type="button" class="close rounded" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="rounded" style="background-color:red; padding:7px;"><i
                                    class="ti-close text-white"></i></span>
                        </button>
                    </div>
                    <div class="modal-body p-0 pb-3">
                        <div>
                            <div class="upper pt-4">
                                <img src="https://picsum.photos/400/150" class="img-fluid">
                            </div>
                            <div class="user ">
                                <img src="./assets/img/blog/avatar.png" class="rounded-circle" width="80">
                            </div>
                            <div class="user-infor container ">
                                <h4 class="ml-3">User Info</h4>
                                <span class="text-muted d-block mb-2">${param.email}</span>

                                <div class="d-flex justify-content-center align-items-center my-4 px-4">
                                    <table class="row text-left">
                                        <tr class="my-2">
                                            <td class="pr-3">ID: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">${param.userID}</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Full Name: </td>
                                            <td class="text-muted">${param.name}</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Day of birth: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">${param.doB}</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Adress: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">${param.address}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class=" text-center">
                                    <form action="./ManageMember" method="POST">
                                        <input type="hidden" name="typeOfRequest" value="delete" />
                                        <input type="hidden" name="userID" value="${param.userID}" />
                                        <input type="hidden" name="clubID" value="${param.clubID}" />
                                        <button type="submit" class="delete-user-btn btn btn-danger "><i class="ti-trash"></i> Delete
                                        User</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>