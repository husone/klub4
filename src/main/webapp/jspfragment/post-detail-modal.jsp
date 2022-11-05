<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script>
        $(document).ready(function () {
            $('.editModalButton').click(function () {
                $('#edit-modal').modal('show');
            });
        });
    </script>
        <div class="modal fade" id="edit-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:600px">
                    <div class="modal-header">
                        <h1>Hello</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="detail-post-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:600px ;">
                    <div class="detail-user container d-flex justify-content-center align-items-center p-0">
                        <div class="card text-black">
                            <div class="modal-header border-0 m-0">
                                <h3>Post Detail</h3>
                                <button type="button" class="close rounded" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="rounded"
                                        style="background-color:red; padding:7px;"><i
                                            class="ti-close text-white"></i></span>
                                </button>

                            </div>

                            <div class="modal-body p-0 pb-3">
                                <table class="table mx-auto" style="width: 80% ;">
                                    <tr>
                                        <td class="text-info">
                                            <h4>Id</h4>
                                        </td>
                                        <td>
                                            <h4>${param.postID}</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-info">
                                            <h4>Title</h4>
                                        </td>
                                        <td>
                                            <h4>${param.title}</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-info">
                                            <h4>Content</h4>
                                        </td>
                                        <td>
                                            <h4>${param.content}</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-info">
                                            <h4>Date Create</h4>
                                        </td>
                                        <td>
                                            <h4>${param.dateString}</h4>
                                        </td>
                                    </tr>
                                </table>

                                <div class="col-7 offset-1">
                                    <form>
                                        <input type="hidden" name="typeOfRequest" value="updatePost" />
                                        <button type="submit" class="editModalButton btn btn-success">Edit</button>
                                    </form>
                                    <form action="./PostServlet" method="POST">
                                        <input type="hidden" name="typeOfRequest" value="deletePost" />
                                        <button type="submit" class="btn btn-danger" id="conDelete">Delete</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>