<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="modal fade" id="detail-fund-modal" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:600px ;">
            <div class="detail-user container d-flex justify-content-center align-items-center p-0">
                <div class="card text-black">
                    <div class="modal-header border-0 m-0">
                        <h3>Detail Amount Contribution</h3>
                        <button type="button" class="close rounded" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="rounded" style="background-color:red; padding:7px;"><i
                                    class="ti-close text-white"></i></span>
                        </button>

                    </div>

                    <div class="modal-body p-0 pb-3">
                        <table class="table mx-auto" style="width: 80% ;">
                            <tr>
                                <td class="text-info"><h4>Id</h4></td>
                                <td><h4>${param.fundId}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Name</h4></td>
                                <td><h4>${param.fundName}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Amount/Person</h4></td>
                                <td><h4>${param.amount}k</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Total Amount</h4></td>
                                <td><h4>${param.amount * 2}k</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Day Create</h4></td>
                                <td><h4>${param.dateString}</h4></td>
                            </tr>
                        </table>

                        <div class="text-center">
                            <button class="btn btn-success">Mark as completed</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>