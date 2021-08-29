@extends('layout')

@section('content')

<div class="container-fluid">
                <!-- Start Page Content -->
                <div class="row">

                	<div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Cities </h4>

                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                            </tr>
                                        </thead>
                                        <div class="infinite-scroll">
                                        <tbody>
                                        	@foreach ($cities as $city)
                                        		<tr>
                                                    <td>{{ $city->name }}</td>
                                        		</tr>
                                        	@endforeach
                                        </tbody>
                                        </div>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

<script type="text/javascript">
    $('#delete_link').click(function (e) {
        $(this).parent().submit();
    });
</script>

<script type="text/javascript">
    $(function() {
        $('.infinite-scroll').jscroll({
            autoTrigger: true,
            url :'{{ URL('city')  }}' ,
            padding: 0,
            nextSelector: '.pagination li.active + li a',
            contentSelector: 'div.infinite-scroll',
            callback: function() {
                $('ul.pagination').remove();
            }
        });
    });
</script>

@stop