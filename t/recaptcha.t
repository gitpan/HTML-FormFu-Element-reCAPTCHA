use strict;
use warnings;

use Test::More tests => 1;

use HTML::FormFu;

my $form = HTML::FormFu->new(
    { tt_args => { INCLUDE_PATH => 'share/templates/tt/xhtml' } } );

$form->load_config_file('t/recaptcha.yml');

my $form_xhtml = <<EOF;
<form action="" method="post">
<div>
<span class="elements">
<script type="text/javascript">
//<![CDATA[
var RecaptchaOptions = {};
//]]>
</script>
<script src="http://www.google.com/recaptcha/api/challenge?k=xxx" type="text/javascript"></script>
<noscript><iframe frameborder="0" height="300" src="http://www.google.com/recaptcha/api/noscript?k=xxx" width="500"></iframe><textarea cols="40" name="recaptcha_challenge_field" rows="3"></textarea><input name="recaptcha_response_field" type="hidden" value="manual_challenge" /></noscript>
</span>
</div>
</form>
EOF

is( "$form", $form_xhtml, 'stringified form' );

