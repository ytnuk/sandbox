<?php

namespace WebEdit\Home\Admin;

use WebEdit\Admin;

final class Presenter extends Admin\Presenter {

    public function renderView() {
        $this['menu']->showHeader(FALSE);
    }

}
