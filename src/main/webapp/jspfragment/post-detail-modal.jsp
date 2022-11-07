<style>
    table {
        border-collapse: collapse;
    }
</style>

<div class="modal fade" id="edit-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:600px">
            <div class="col-md-12 grid-margin stretch-card">
                <div class="card text-black">
                    <div class="card-body form">
                        <h2 class='mb-2 col-7' style='padding-left: 0;color: #393E46'>Edit Post</h2>
                        <form action="PostServlet" method="POST">
                            <div class="form-group row">
                                <label for="imgPost"
                                       class="col-sm-3 col-form-label ml-1 font-weight-bold">Image</label>
                                <h5 class="image-data"></h5>
                                <input type="file" class="form-input col-sm-9" alt="img-post" id="imgPost"
                                       name="image" onchange="onFileSelected(event)">
                                <input value="${param.image}" name="image-url" id="image-url" style="display: none" required>

                            </div>
                            <div class="form-group row">
                                <label for="namePost"
                                       class="col-sm-3 col-form-label ml-1 font-weight-bold">Title</label>
                                <input type="text" class="form-control col-sm-8" id="namePost"
                                       placeholder="Post Title" name="title" value="${param.title}">

                            </div>
                            <div class="form-group row">
                                <label for="contentPost"
                                       class="col-sm-3 col-form-label ml-1 font-weight-bold">Content</label>
                                <input type="text" class="form-control col-sm-8" id="contentPost"
                                       placeholder="Content" name="content" value="${param.content}">
                            </div>
                            <input type="hidden" name="typeOfRequest" value="updatePost">
                            <input type="hidden" name="postID" value="${param.postID}">
                            <div class="col-sm-6 offset-6">

                                <button class="btn-success btn col-5"  type="submit">Edit</button>


                                <a href="./ManagePost" class="btn btn-danger mx-1 col-5" type="reset">Cancel</a>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="detail-post-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: auto;">
            <div class="detail-user container d-flex p-2">
                <div class="card">
                    <div class="modal-header border-0">
                        <h2 class='col-7' style='padding-left: 0;color: #393E46'>Post Detail</h2>
                        <button type="button" class="btn-danger rounded" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="rounded"
                                  style="btn-danger"><i
                                    class="ti-close text-white"></i></span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class='table-responsive'>
                            <table class='table table-borderless'>
                                <tr>
                                    <th style='background-color: #393E46' scope='row' class='table-dark'>ID</th>
                                    <td style="text-align: left; vertical-align: middle; background-color: #F2E7D5; color: #0E5E6F" class=''>${param.postID}</td>
                                </tr>
                                <tr>
                                    <th style='background-color: #393E46' scope='row' class='table-dark'>TITLE</th>
                                    <td style="text-align: left; vertical-align: middle; background-color: #F2E7D5; color: #0E5E6F" class='table-light'>${param.title}</td>
                                </tr>
                                <tr>
                                    <th style='background-color: #393E46' scope='row' class='table-dark'>CONTENT</th>
                                    <td style="text-align: left; vertical-align: middle; background-color: #F2E7D5; color: #0E5E6F" class='table-light'>${param.content}</td>
                                </tr>
                                <tr>
                                    <th style='background-color: #393E46' scope='row' class='table-dark'>Date Created</th>
                                    <td style="text-align: left; vertical-align: middle; background-color: #F2E7D5; color: #0E5E6F" class='table-light'>${param.dateString}</td>
                                </tr>
                            </table>
                        </div>
                    </div><!-- comment -->
                    <div class='modal-footer' style='border-top: none'>
                        <div class="d-flex mt-2">
                            <button data-toggle="tooltip" data-placement="top" 
                                    title="Click to view detail" 
                                    class="editModalButton btn btn-success">Edit</button>
                            <form action="./PostServlet" method="POST" class="">
                                <input type="hidden" name="typeOfRequest" value="deletePost" />
                                <button type="submit" class="btn btn-danger mx-1" id="conDelete">Delete</button>
                                <input type="hidden" name="postID" value="${param.postID}" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>