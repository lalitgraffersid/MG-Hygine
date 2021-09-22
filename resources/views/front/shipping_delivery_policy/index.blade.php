@extends('front.layout.master')
@section('content')

<section class="top-space">
	<div class="container-fluid">
		<div class="row">
			<div class="grey-bg full-width">
				<div class="container">
						{!! $result->description !!}
				</div>
			</div>
		</div>
	</div>
</section>


@endsection

@section('script')
<script>
	
</script>
@endsection