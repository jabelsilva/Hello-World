inline = {
    baseUrl: window.location.href,
    initialize: function () {
        $('.action-create').live('click', function () {
            inline.action_create($(this));
        });
        $('.action-update').live('click', function () {
            inline.action_update($(this));
        });
        $('.action-edit').live('click', function () {
            inline.action_edit($(this));
        });
        $('.action-cancel').live('click', function () {
            inline.action_cancel($(this));
        });
        $('.action-delete').live('click', function () {
            inline.action_delete($(this));
        });
    },
    action_create: function (obj) {
        var row = obj.parents('tr');
        var body = row.parents('table').find('tbody');

        $.ajax({
            type: 'post',
            url: inline.baseUrl + '/create',
            data: inline.serilizeRow(row),
            dataType: 'html',
            success: function (request) {
                body.append(request);
            }
        });

        obj.find('input,textArea').val('');
    },
    action_update: function (obj) {
        var row = obj.parents('tr');

        $.ajax({
            type: 'post',
            url: inline.baseUrl + '/update',
            data: inline.serilizeRow(row),
            dataType: 'html',
            success: function (request) {
                row.replaceWith(request);
            }
        });
    },
    action_edit: function (obj) {
        var row = obj.parents('tr');
        var key = row.find('input#Id').val();

        $.ajax({
            type: 'POST',
            dataType: 'HTML',
            url: inline.baseUrl + '/edit/' + key,
            complete: function (request) {
                row.replaceWith(request.responseText);
            }
        });
        return true;
    },
    action_cancel: function (obj) {
        var row = obj.parents('tr');
        var key = row.find('input#Id').val();

        $.ajax({
            type: 'POST',
            dataType: 'HTML',
            url: inline.baseUrl + '/cancel/' + key,
            complete: function (request) {
                row.replaceWith(request.responseText);
            }
        });
        return true;
    },
    action_delete: function (obj) {
        var row = obj.parents('tr');
        var key = row.find('input#Id').val();

        if (!confirm('Deseja apagar?'))
            return false;

        $.ajax({
            type: 'DELETE',
            dataType: 'text',
            url: inline.baseUrl + '/delete/' + key,
            complete: function (request) {
                //$().message(request.statusText);
                if (request.status == 200)
                    row.remove();
            }
        });
        return true;
    },
    serilizeRow: function ($row) {

        var row = new Object();
        $row.find('input,select,textarea').each(function () {

            var $type = $(this).attr("type");
            var $name = $(this).attr('id');

            if ($type == "checkbox") {
                row[$name] = $(this).is(':checked');
            }
            else {
                row[$name] = $(this).val();
            }
        });

        return row;
    }
}