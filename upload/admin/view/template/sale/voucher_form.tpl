<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="box-heading">
      <h1><i class="icon-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="box-content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <div class="buttons"><a onclick="$('#form').submit();" class="btn"><i class="icon-ok"></i> <?php echo $button_save; ?></a> <a href="<?php echo $cancel; ?>" class="btn"><i class="icon-remove"></i> <?php echo $button_cancel; ?></a></div>
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <?php if ($voucher_id) { ?>
          <li><a href="#tab-history" data-toggle="tab"><?php echo $tab_voucher_history; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_code; ?></label>
              <div class="controls">
                <input type="text" name="code" value="<?php echo $code; ?>" /> <span class="help-inline"><i data-toggle="tooltip" data-placement="top" data-original-title="<?php echo $help_code; ?>" class="icon-question-sign"></i></span>
                <?php if ($error_code) { ?>
                <span class="error"><?php echo $error_code; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_from_name; ?></label>
              <div class="controls">
                <input type="text" name="from_name" value="<?php echo $from_name; ?>" />
                <?php if ($error_from_name) { ?>
                <span class="error"><?php echo $error_from_name; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_from_email; ?></label>
              <div class="controls">
                <input type="text" name="from_email" value="<?php echo $from_email; ?>" />
                <?php if ($error_from_email) { ?>
                <span class="error"><?php echo $error_from_email; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_to_name; ?></label>
              <div class="controls">
                <input type="text" name="to_name" value="<?php echo $to_name; ?>" />
                <?php if ($error_to_name) { ?>
                <span class="error"><?php echo $error_to_name; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_to_email; ?></label>
              <div class="controls">
                <input type="text" name="to_email" value="<?php echo $to_email; ?>" />
                <?php if ($error_to_email) { ?>
                <span class="error"><?php echo $error_to_email; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><?php echo $entry_theme; ?></label>
              <div class="controls">
                <select name="voucher_theme_id">
                  <?php foreach ($voucher_themes as $voucher_theme) { ?>
                  <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                  <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>" selected="selected"><?php echo $voucher_theme['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><span class="required">*</span> <?php echo $entry_message; ?></label>
              <div class="controls">
                <textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><?php echo $entry_amount; ?></label>
              <div class="controls">
                <input type="text" name="amount" value="<?php echo $amount; ?>" />
                <?php if ($error_amount) { ?>
                <span class="error"><?php echo $error_amount; ?></span>
                <?php } ?>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input-name"><?php echo $entry_status; ?></label>
              <div class="controls">
                <select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          </div>
          <?php if ($voucher_id) { ?>
          <div class="tab-pane" id="tab-history">
            <div id="history"></div>
          </div>
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
</div>
<?php if ($voucher_id) { ?>
<script type="text/javascript"><!--
$('#history .pagination a').on('click', function() {
	$('#history').load(this.href);
	
	return false;
});			

$('#history').load('index.php?route=sale/voucher/history&token=<?php echo $token; ?>&voucher_id=<?php echo $voucher_id; ?>');
//--></script>
<?php } ?>
<?php echo $footer; ?>