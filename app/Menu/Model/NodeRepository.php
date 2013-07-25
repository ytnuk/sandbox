<?php

namespace CMS\Menu\Model;

use CMS\Model\BaseRepository as Repository;
use Nette\Database\Table;

class NodeRepository extends Repository {

    private $temp;

    /**
     * 
     * @param int $id
     * @return Table\ActiveRow
     */
    public function getNode($id) {
        return $this->table()->where('id', $id)->fetch();
    }

    /**
     * 
     * @param string $link
     * @param int|null $link_id
     * @return Table\ActiveRow
     */
    public function getNodeByLink($link, $link_id = NULL) {
        return $this->table()->where(array('link' => $link, 'link_id' => $link_id))->fetch();
    }

    /**
     * 
     * @param Table\ActiveRow $list
     * @return Table\ActiveRow
     */
    public function getRootNode($list) {
        return $list->related('node')->where('node_id', NULL)->fetch();
    }

    /**
     * 
     * @return Table\Selection
     */
    public function getAllRootNodes() {
        return $this->table()->where('node_id', NULL);
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @return Table\ActiveRow
     */
    public function setRootNode($node) {
        $rootNode = $this->getRootNode($node->list);
        $rootNode->related('node')->update(array('node_id' => $node->id));
        $rootNode->update(array('node_id' => $node->id));
        return $node->update(array('node_id' => NULL));
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @return array
     */
    public function getBreadcrumb($node) {
        $breadcrumb = $this->getParentNodes($node);
        $breadcrumb[] = $node;
        return $breadcrumb;
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @return array
     */
    public function getChildNodes($node) {
        $this->temp = array();
        $this->compileChildNodes($node);
        return $this->temp;
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @return array
     */
    public function getParentNodes($node) {
        $this->temp = array();
        while ($node->node) {
            $this->temp[] = $node->node;
            $node = $node->node;
        }
        return array_reverse($this->temp);
    }

    /**
     * 
     * @param Table\ActiveRow $node
     */
    private function compileChildNodes($node) {
        foreach ($node->related('node') as $child) {
            $this->temp[] = $child;
            $this->compileChildNodes($child);
        }
    }

    /**
     * 
     * @param Table\ActiveRow $node
     */
    public function getParentNodeSelect($node) {
        $data = $node->list->related('node')->fetchPairs('id', 'title');
        unset($data[$node->id]);
        foreach ($this->getChildNodes($node) as $child) {
            unset($data[$child->id]);
        }
        return $data;
    }

    /**
     * 
     * @param string $title
     * @param string $link
     * @param int|null $link_id
     * @param string $list
     * @return Table\ActiveRow
     */
    public function addNode($list, $title, $link, $link_id = NULL) {
        $data = array(
            'node_id' => $this->getRootNode($list)->id,
            'list_id' => $list->id,
            'title' => $title,
            'link' => $link,
            'link_id' => $link_id,
            'position' => 0
        );
        return $this->table()->insert($data);
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @param array $data
     * @return Table\ActiveRow
     */
    public function updateNode($node, $data) {
        return $node->update($data);
    }

    /**
     * 
     * @param Table\ActiveRow $node
     * @return boolean
     */
    public function removeNode($node) {
        $rootNode = $this->getRootNode($node->list);
        if ($node->id !== $rootNode->id) {
            $node->related('node')->update(array('node_id' => $node->node_id));
            return $node->delete();
        }
        return false;
    }

}