
<div class="panel panel-default">
    <div class="panel-heading">Search</div>
    <div class="panel-body">

        <form id="searchForm" class="input-group" action="./list">
            <input id="searchQuery" type="text" class="form-control" name="query" value="${param.query}" />
            <div class="input-group-btn">
                <button class="btn btn-primary" type="submit" >Search</button>
                <a class="btn btn-secondary" type="button" href="./list">Clear</a>
            </div>
        </form>
    </div>
</div>