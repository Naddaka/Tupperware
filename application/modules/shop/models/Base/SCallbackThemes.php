<?php

namespace Base;

use \SCallbackThemes as ChildSCallbackThemes;
use \SCallbackThemesI18n as ChildSCallbackThemesI18n;
use \SCallbackThemesI18nQuery as ChildSCallbackThemesI18nQuery;
use \SCallbackThemesQuery as ChildSCallbackThemesQuery;
use \SCallbacks as ChildSCallbacks;
use \SCallbacksQuery as ChildSCallbacksQuery;
use \Exception;
use \PDO;
use CMSFactory\PropelBaseModelClass;
use Map\SCallbackThemesI18nTableMap;
use Map\SCallbackThemesTableMap;
use Map\SCallbacksTableMap;
use Propel\Runtime\Propel;
use Propel\Runtime\ActiveQuery\Criteria;
use Propel\Runtime\ActiveQuery\ModelCriteria;
use Propel\Runtime\ActiveRecord\ActiveRecordInterface;
use Propel\Runtime\Collection\Collection;
use Propel\Runtime\Collection\ObjectCollection;
use Propel\Runtime\Connection\ConnectionInterface;
use Propel\Runtime\Exception\BadMethodCallException;
use Propel\Runtime\Exception\LogicException;
use Propel\Runtime\Exception\PropelException;
use Propel\Runtime\Map\TableMap;
use Propel\Runtime\Parser\AbstractParser;

/**
 * Base class that represents a row from the 'shop_callbacks_themes' table.
 *
 *
 *
 * @package    propel.generator.shop.models.Base
 */
abstract class SCallbackThemes extends PropelBaseModelClass implements ActiveRecordInterface
{
    /**
     * TableMap class name
     */
    const TABLE_MAP = '\\Map\\SCallbackThemesTableMap';


    /**
     * attribute to determine if this object has previously been saved.
     * @var boolean
     */
    protected $new = true;

    /**
     * attribute to determine whether this object has been deleted.
     * @var boolean
     */
    protected $deleted = false;

    /**
     * The columns that have been modified in current object.
     * Tracking modified columns allows us to only update modified columns.
     * @var array
     */
    protected $modifiedColumns = array();

    /**
     * The (virtual) columns that are added at runtime
     * The formatters can add supplementary columns based on a resultset
     * @var array
     */
    protected $virtualColumns = array();

    /**
     * The value for the id field.
     *
     * @var        int
     */
    protected $id;

    /**
     * The value for the position field.
     *
     * @var        int
     */
    protected $position;

    /**
     * @var        ObjectCollection|ChildSCallbacks[] Collection to store aggregation of ChildSCallbacks objects.
     */
    protected $collSCallbackss;
    protected $collSCallbackssPartial;

    /**
     * @var        ObjectCollection|ChildSCallbackThemesI18n[] Collection to store aggregation of ChildSCallbackThemesI18n objects.
     */
    protected $collSCallbackThemesI18ns;
    protected $collSCallbackThemesI18nsPartial;

    /**
     * Flag to prevent endless save loop, if this object is referenced
     * by another object which falls in this transaction.
     *
     * @var boolean
     */
    protected $alreadyInSave = false;

    // i18n behavior

    /**
     * Current locale
     * @var        string
     */
    protected $currentLocale = 'ru';

    /**
     * Current translation objects
     * @var        array[ChildSCallbackThemesI18n]
     */
    protected $currentTranslations;

    /**
     * An array of objects scheduled for deletion.
     * @var ObjectCollection|ChildSCallbacks[]
     */
    protected $sCallbackssScheduledForDeletion = null;

    /**
     * An array of objects scheduled for deletion.
     * @var ObjectCollection|ChildSCallbackThemesI18n[]
     */
    protected $sCallbackThemesI18nsScheduledForDeletion = null;

    /**
     * Initializes internal state of Base\SCallbackThemes object.
     */
    public function __construct()
    {
    }

    /**
     * Returns whether the object has been modified.
     *
     * @return boolean True if the object has been modified.
     */
    public function isModified()
    {
        return !!$this->modifiedColumns;
    }

    /**
     * Has specified column been modified?
     *
     * @param  string  $col column fully qualified name (TableMap::TYPE_COLNAME), e.g. Book::AUTHOR_ID
     * @return boolean True if $col has been modified.
     */
    public function isColumnModified($col)
    {
        return $this->modifiedColumns && isset($this->modifiedColumns[$col]);
    }

    /**
     * Get the columns that have been modified in this object.
     * @return array A unique list of the modified column names for this object.
     */
    public function getModifiedColumns()
    {
        return $this->modifiedColumns ? array_keys($this->modifiedColumns) : [];
    }

    /**
     * Returns whether the object has ever been saved.  This will
     * be false, if the object was retrieved from storage or was created
     * and then saved.
     *
     * @return boolean true, if the object has never been persisted.
     */
    public function isNew()
    {
        return $this->new;
    }

    /**
     * Setter for the isNew attribute.  This method will be called
     * by Propel-generated children and objects.
     *
     * @param boolean $b the state of the object.
     */
    public function setNew($b)
    {
        $this->new = (boolean) $b;
    }

    /**
     * Whether this object has been deleted.
     * @return boolean The deleted state of this object.
     */
    public function isDeleted()
    {
        return $this->deleted;
    }

    /**
     * Specify whether this object has been deleted.
     * @param  boolean $b The deleted state of this object.
     * @return void
     */
    public function setDeleted($b)
    {
        $this->deleted = (boolean) $b;
    }

    /**
     * Sets the modified state for the object to be false.
     * @param  string $col If supplied, only the specified column is reset.
     * @return void
     */
    public function resetModified($col = null)
    {
        if (null !== $col) {
            if (isset($this->modifiedColumns[$col])) {
                unset($this->modifiedColumns[$col]);
            }
        } else {
            $this->modifiedColumns = array();
        }
    }

    /**
     * Compares this with another <code>SCallbackThemes</code> instance.  If
     * <code>obj</code> is an instance of <code>SCallbackThemes</code>, delegates to
     * <code>equals(SCallbackThemes)</code>.  Otherwise, returns <code>false</code>.
     *
     * @param  mixed   $obj The object to compare to.
     * @return boolean Whether equal to the object specified.
     */
    public function equals($obj)
    {
        if (!$obj instanceof static) {
            return false;
        }

        if ($this === $obj) {
            return true;
        }

        if (null === $this->getPrimaryKey() || null === $obj->getPrimaryKey()) {
            return false;
        }

        return $this->getPrimaryKey() === $obj->getPrimaryKey();
    }

    /**
     * Get the associative array of the virtual columns in this object
     *
     * @return array
     */
    public function getVirtualColumns()
    {
        return $this->virtualColumns;
    }

    /**
     * Checks the existence of a virtual column in this object
     *
     * @param  string  $name The virtual column name
     * @return boolean
     */
    public function hasVirtualColumn($name)
    {
        return array_key_exists($name, $this->virtualColumns);
    }

    /**
     * Get the value of a virtual column in this object
     *
     * @param  string $name The virtual column name
     * @return mixed
     *
     * @throws PropelException
     */
    public function getVirtualColumn($name)
    {
        if (!$this->hasVirtualColumn($name)) {
            throw new PropelException(sprintf('Cannot get value of inexistent virtual column %s.', $name));
        }

        return $this->virtualColumns[$name];
    }

    /**
     * Set the value of a virtual column in this object
     *
     * @param string $name  The virtual column name
     * @param mixed  $value The value to give to the virtual column
     *
     * @return $this|SCallbackThemes The current object, for fluid interface
     */
    public function setVirtualColumn($name, $value)
    {
        $this->virtualColumns[$name] = $value;

        return $this;
    }

    /**
     * Logs a message using Propel::log().
     *
     * @param  string  $msg
     * @param  int     $priority One of the Propel::LOG_* logging levels
     * @return boolean
     */
    protected function log($msg, $priority = Propel::LOG_INFO)
    {
        return Propel::log(get_class($this) . ': ' . $msg, $priority);
    }

    /**
     * Export the current object properties to a string, using a given parser format
     * <code>
     * $book = BookQuery::create()->findPk(9012);
     * echo $book->exportTo('JSON');
     *  => {"Id":9012,"Title":"Don Juan","ISBN":"0140422161","Price":12.99,"PublisherId":1234,"AuthorId":5678}');
     * </code>
     *
     * @param  mixed   $parser                 A AbstractParser instance, or a format name ('XML', 'YAML', 'JSON', 'CSV')
     * @param  boolean $includeLazyLoadColumns (optional) Whether to include lazy load(ed) columns. Defaults to TRUE.
     * @return string  The exported data
     */
    public function exportTo($parser, $includeLazyLoadColumns = true)
    {
        if (!$parser instanceof AbstractParser) {
            $parser = AbstractParser::getParser($parser);
        }

        return $parser->fromArray($this->toArray(TableMap::TYPE_PHPNAME, $includeLazyLoadColumns, array(), true));
    }

    /**
     * Clean up internal collections prior to serializing
     * Avoids recursive loops that turn into segmentation faults when serializing
     */
    public function __sleep()
    {
        $this->clearAllReferences();

        $cls = new \ReflectionClass($this);
        $propertyNames = [];
        $serializableProperties = array_diff($cls->getProperties(), $cls->getProperties(\ReflectionProperty::IS_STATIC));

        foreach($serializableProperties as $property) {
            $propertyNames[] = $property->getName();
        }

        return $propertyNames;
    }

    /**
     * Get the [id] column value.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get the [position] column value.
     *
     * @return int
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
     * Set the value of [id] column.
     *
     * @param int $v new value
     * @return $this|\SCallbackThemes The current object (for fluent API support)
     */
    public function setId($v)
    {
        if ($v !== null) {
            $v = (int) $v;
        }

        if ($this->id !== $v) {
            $this->id = $v;
            $this->modifiedColumns[SCallbackThemesTableMap::COL_ID] = true;
        }

        return $this;
    } // setId()

    /**
     * Set the value of [position] column.
     *
     * @param int $v new value
     * @return $this|\SCallbackThemes The current object (for fluent API support)
     */
    public function setPosition($v)
    {
        if ($v !== null) {
            $v = (int) $v;
        }

        if ($this->position !== $v) {
            $this->position = $v;
            $this->modifiedColumns[SCallbackThemesTableMap::COL_POSITION] = true;
        }

        return $this;
    } // setPosition()

    /**
     * Indicates whether the columns in this object are only set to default values.
     *
     * This method can be used in conjunction with isModified() to indicate whether an object is both
     * modified _and_ has some values set which are non-default.
     *
     * @return boolean Whether the columns in this object are only been set with default values.
     */
    public function hasOnlyDefaultValues()
    {
        // otherwise, everything was equal, so return TRUE
        return true;
    } // hasOnlyDefaultValues()

    /**
     * Hydrates (populates) the object variables with values from the database resultset.
     *
     * An offset (0-based "start column") is specified so that objects can be hydrated
     * with a subset of the columns in the resultset rows.  This is needed, for example,
     * for results of JOIN queries where the resultset row includes columns from two or
     * more tables.
     *
     * @param array   $row       The row returned by DataFetcher->fetch().
     * @param int     $startcol  0-based offset column which indicates which restultset column to start with.
     * @param boolean $rehydrate Whether this object is being re-hydrated from the database.
     * @param string  $indexType The index type of $row. Mostly DataFetcher->getIndexType().
                                  One of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME
     *                            TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     *
     * @return int             next starting column
     * @throws PropelException - Any caught Exception will be rewrapped as a PropelException.
     */
    public function hydrate($row, $startcol = 0, $rehydrate = false, $indexType = TableMap::TYPE_NUM)
    {
        try {

            $col = $row[TableMap::TYPE_NUM == $indexType ? 0 + $startcol : SCallbackThemesTableMap::translateFieldName('Id', TableMap::TYPE_PHPNAME, $indexType)];
            $this->id = (null !== $col) ? (int) $col : null;

            $col = $row[TableMap::TYPE_NUM == $indexType ? 1 + $startcol : SCallbackThemesTableMap::translateFieldName('Position', TableMap::TYPE_PHPNAME, $indexType)];
            $this->position = (null !== $col) ? (int) $col : null;
            $this->resetModified();

            $this->setNew(false);

            if ($rehydrate) {
                $this->ensureConsistency();
            }

            return $startcol + 2; // 2 = SCallbackThemesTableMap::NUM_HYDRATE_COLUMNS.

        } catch (Exception $e) {
            throw new PropelException(sprintf('Error populating %s object', '\\SCallbackThemes'), 0, $e);
        }
    }

    /**
     * Checks and repairs the internal consistency of the object.
     *
     * This method is executed after an already-instantiated object is re-hydrated
     * from the database.  It exists to check any foreign keys to make sure that
     * the objects related to the current object are correct based on foreign key.
     *
     * You can override this method in the stub class, but you should always invoke
     * the base method from the overridden method (i.e. parent::ensureConsistency()),
     * in case your model changes.
     *
     * @throws PropelException
     */
    public function ensureConsistency()
    {
    } // ensureConsistency

    /**
     * Reloads this object from datastore based on primary key and (optionally) resets all associated objects.
     *
     * This will only work if the object has been saved and has a valid primary key set.
     *
     * @param      boolean $deep (optional) Whether to also de-associated any related objects.
     * @param      ConnectionInterface $con (optional) The ConnectionInterface connection to use.
     * @return void
     * @throws PropelException - if this object is deleted, unsaved or doesn't have pk match in db
     */
    public function reload($deep = false, ConnectionInterface $con = null)
    {
        if ($this->isDeleted()) {
            throw new PropelException("Cannot reload a deleted object.");
        }

        if ($this->isNew()) {
            throw new PropelException("Cannot reload an unsaved object.");
        }

        if ($con === null) {
            $con = Propel::getServiceContainer()->getReadConnection(SCallbackThemesTableMap::DATABASE_NAME);
        }

        // We don't need to alter the object instance pool; we're just modifying this instance
        // already in the pool.

        $dataFetcher = ChildSCallbackThemesQuery::create(null, $this->buildPkeyCriteria())->setFormatter(ModelCriteria::FORMAT_STATEMENT)->find($con);
        $row = $dataFetcher->fetch();
        $dataFetcher->close();
        if (!$row) {
            throw new PropelException('Cannot find matching row in the database to reload object values.');
        }
        $this->hydrate($row, 0, true, $dataFetcher->getIndexType()); // rehydrate

        if ($deep) {  // also de-associate any related objects?

            $this->collSCallbackss = null;

            $this->collSCallbackThemesI18ns = null;

        } // if (deep)
    }

    /**
     * Removes this object from datastore and sets delete attribute.
     *
     * @param      ConnectionInterface $con
     * @return void
     * @throws PropelException
     * @see SCallbackThemes::setDeleted()
     * @see SCallbackThemes::isDeleted()
     */
    public function delete(ConnectionInterface $con = null)
    {
        if ($this->isDeleted()) {
            throw new PropelException("This object has already been deleted.");
        }

        if ($con === null) {
            $con = Propel::getServiceContainer()->getWriteConnection(SCallbackThemesTableMap::DATABASE_NAME);
        }

        $con->transaction(function () use ($con) {
            $deleteQuery = ChildSCallbackThemesQuery::create()
                ->filterByPrimaryKey($this->getPrimaryKey());
            $ret = $this->preDelete($con);
            if ($ret) {
                $deleteQuery->delete($con);
                $this->postDelete($con);
                $this->setDeleted(true);
            }
        });
    }

    /**
     * Persists this object to the database.
     *
     * If the object is new, it inserts it; otherwise an update is performed.
     * All modified related objects will also be persisted in the doSave()
     * method.  This method wraps all precipitate database operations in a
     * single transaction.
     *
     * @param      ConnectionInterface $con
     * @return int             The number of rows affected by this insert/update and any referring fk objects' save() operations.
     * @throws PropelException
     * @see doSave()
     */
    public function save(ConnectionInterface $con = null)
    {
        if ($this->isDeleted()) {
            throw new PropelException("You cannot save an object that has been deleted.");
        }

        if ($this->alreadyInSave) {
            return 0;
        }

        if ($con === null) {
            $con = Propel::getServiceContainer()->getWriteConnection(SCallbackThemesTableMap::DATABASE_NAME);
        }

        return $con->transaction(function () use ($con) {
            $ret = $this->preSave($con);
            $isInsert = $this->isNew();
            if ($isInsert) {
                $ret = $ret && $this->preInsert($con);
            } else {
                $ret = $ret && $this->preUpdate($con);
            }
            if ($ret) {
                $affectedRows = $this->doSave($con);
                if ($isInsert) {
                    $this->postInsert($con);
                } else {
                    $this->postUpdate($con);
                }
                $this->postSave($con);
                SCallbackThemesTableMap::addInstanceToPool($this);
            } else {
                $affectedRows = 0;
            }

            return $affectedRows;
        });
    }

    /**
     * Performs the work of inserting or updating the row in the database.
     *
     * If the object is new, it inserts it; otherwise an update is performed.
     * All related objects are also updated in this method.
     *
     * @param      ConnectionInterface $con
     * @return int             The number of rows affected by this insert/update and any referring fk objects' save() operations.
     * @throws PropelException
     * @see save()
     */
    protected function doSave(ConnectionInterface $con)
    {
        $affectedRows = 0; // initialize var to track total num of affected rows
        if (!$this->alreadyInSave) {
            $this->alreadyInSave = true;

            if ($this->isNew() || $this->isModified()) {
                // persist changes
                if ($this->isNew()) {
                    $this->doInsert($con);
                    $affectedRows += 1;
                } else {
                    $affectedRows += $this->doUpdate($con);
                }
                $this->resetModified();
            }

            if ($this->sCallbackssScheduledForDeletion !== null) {
                if (!$this->sCallbackssScheduledForDeletion->isEmpty()) {
                    foreach ($this->sCallbackssScheduledForDeletion as $sCallbacks) {
                        // need to save related object because we set the relation to null
                        $sCallbacks->save($con);
                    }
                    $this->sCallbackssScheduledForDeletion = null;
                }
            }

            if ($this->collSCallbackss !== null) {
                foreach ($this->collSCallbackss as $referrerFK) {
                    if (!$referrerFK->isDeleted() && ($referrerFK->isNew() || $referrerFK->isModified())) {
                        $affectedRows += $referrerFK->save($con);
                    }
                }
            }

            if ($this->sCallbackThemesI18nsScheduledForDeletion !== null) {
                if (!$this->sCallbackThemesI18nsScheduledForDeletion->isEmpty()) {
                    \SCallbackThemesI18nQuery::create()
                        ->filterByPrimaryKeys($this->sCallbackThemesI18nsScheduledForDeletion->getPrimaryKeys(false))
                        ->delete($con);
                    $this->sCallbackThemesI18nsScheduledForDeletion = null;
                }
            }

            if ($this->collSCallbackThemesI18ns !== null) {
                foreach ($this->collSCallbackThemesI18ns as $referrerFK) {
                    if (!$referrerFK->isDeleted() && ($referrerFK->isNew() || $referrerFK->isModified())) {
                        $affectedRows += $referrerFK->save($con);
                    }
                }
            }

            $this->alreadyInSave = false;

        }

        return $affectedRows;
    } // doSave()

    /**
     * Insert the row in the database.
     *
     * @param      ConnectionInterface $con
     *
     * @throws PropelException
     * @see doSave()
     */
    protected function doInsert(ConnectionInterface $con)
    {
        $modifiedColumns = array();
        $index = 0;

        $this->modifiedColumns[SCallbackThemesTableMap::COL_ID] = true;
        if (null !== $this->id) {
            throw new PropelException('Cannot insert a value for auto-increment primary key (' . SCallbackThemesTableMap::COL_ID . ')');
        }

         // check the columns in natural order for more readable SQL queries
        if ($this->isColumnModified(SCallbackThemesTableMap::COL_ID)) {
            $modifiedColumns[':p' . $index++]  = 'id';
        }
        if ($this->isColumnModified(SCallbackThemesTableMap::COL_POSITION)) {
            $modifiedColumns[':p' . $index++]  = 'position';
        }

        $sql = sprintf(
            'INSERT INTO shop_callbacks_themes (%s) VALUES (%s)',
            implode(', ', $modifiedColumns),
            implode(', ', array_keys($modifiedColumns))
        );

        try {
            $stmt = $con->prepare($sql);
            foreach ($modifiedColumns as $identifier => $columnName) {
                switch ($columnName) {
                    case 'id':
                        $stmt->bindValue($identifier, $this->id, PDO::PARAM_INT);
                        break;
                    case 'position':
                        $stmt->bindValue($identifier, $this->position, PDO::PARAM_INT);
                        break;
                }
            }
            $stmt->execute();
        } catch (Exception $e) {
            Propel::log($e->getMessage(), Propel::LOG_ERR);
            throw new PropelException(sprintf('Unable to execute INSERT statement [%s]', $sql), 0, $e);
        }

        try {
            $pk = $con->lastInsertId();
        } catch (Exception $e) {
            throw new PropelException('Unable to get autoincrement id.', 0, $e);
        }
        $this->setId($pk);

        $this->setNew(false);
    }

    /**
     * Update the row in the database.
     *
     * @param      ConnectionInterface $con
     *
     * @return Integer Number of updated rows
     * @see doSave()
     */
    protected function doUpdate(ConnectionInterface $con)
    {
        $selectCriteria = $this->buildPkeyCriteria();
        $valuesCriteria = $this->buildCriteria();

        return $selectCriteria->doUpdate($valuesCriteria, $con);
    }

    /**
     * Retrieves a field from the object by name passed in as a string.
     *
     * @param      string $name name
     * @param      string $type The type of fieldname the $name is of:
     *                     one of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME
     *                     TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     *                     Defaults to TableMap::TYPE_PHPNAME.
     * @return mixed Value of field.
     */
    public function getByName($name, $type = TableMap::TYPE_PHPNAME)
    {
        $pos = SCallbackThemesTableMap::translateFieldName($name, $type, TableMap::TYPE_NUM);
        $field = $this->getByPosition($pos);

        return $field;
    }

    /**
     * Retrieves a field from the object by Position as specified in the xml schema.
     * Zero-based.
     *
     * @param      int $pos position in xml schema
     * @return mixed Value of field at $pos
     */
    public function getByPosition($pos)
    {
        switch ($pos) {
            case 0:
                return $this->getId();
                break;
            case 1:
                return $this->getPosition();
                break;
            default:
                return null;
                break;
        } // switch()
    }

    /**
     * Exports the object as an array.
     *
     * You can specify the key type of the array by passing one of the class
     * type constants.
     *
     * @param     string  $keyType (optional) One of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME,
     *                    TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     *                    Defaults to TableMap::TYPE_PHPNAME.
     * @param     boolean $includeLazyLoadColumns (optional) Whether to include lazy loaded columns. Defaults to TRUE.
     * @param     array $alreadyDumpedObjects List of objects to skip to avoid recursion
     * @param     boolean $includeForeignObjects (optional) Whether to include hydrated related objects. Default to FALSE.
     *
     * @return array an associative array containing the field names (as keys) and field values
     */
    public function toArray($keyType = TableMap::TYPE_PHPNAME, $includeLazyLoadColumns = true, $alreadyDumpedObjects = array(), $includeForeignObjects = false)
    {

        if (isset($alreadyDumpedObjects['SCallbackThemes'][$this->hashCode()])) {
            return '*RECURSION*';
        }
        $alreadyDumpedObjects['SCallbackThemes'][$this->hashCode()] = true;
        $keys = SCallbackThemesTableMap::getFieldNames($keyType);
        $result = array(
            $keys[0] => $this->getId(),
            $keys[1] => $this->getPosition(),
        );
        $virtualColumns = $this->virtualColumns;
        foreach ($virtualColumns as $key => $virtualColumn) {
            $result[$key] = $virtualColumn;
        }

        if ($includeForeignObjects) {
            if (null !== $this->collSCallbackss) {

                switch ($keyType) {
                    case TableMap::TYPE_CAMELNAME:
                        $key = 'sCallbackss';
                        break;
                    case TableMap::TYPE_FIELDNAME:
                        $key = 'shop_callbackss';
                        break;
                    default:
                        $key = 'SCallbackss';
                }

                $result[$key] = $this->collSCallbackss->toArray(null, false, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
            }
            if (null !== $this->collSCallbackThemesI18ns) {

                switch ($keyType) {
                    case TableMap::TYPE_CAMELNAME:
                        $key = 'sCallbackThemesI18ns';
                        break;
                    case TableMap::TYPE_FIELDNAME:
                        $key = 'shop_callbacks_themes_i18ns';
                        break;
                    default:
                        $key = 'SCallbackThemesI18ns';
                }

                $result[$key] = $this->collSCallbackThemesI18ns->toArray(null, false, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
            }
        }

        return $result;
    }

    /**
     * Sets a field from the object by name passed in as a string.
     *
     * @param  string $name
     * @param  mixed  $value field value
     * @param  string $type The type of fieldname the $name is of:
     *                one of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME
     *                TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     *                Defaults to TableMap::TYPE_PHPNAME.
     * @return $this|\SCallbackThemes
     */
    public function setByName($name, $value, $type = TableMap::TYPE_PHPNAME)
    {
        $pos = SCallbackThemesTableMap::translateFieldName($name, $type, TableMap::TYPE_NUM);

        return $this->setByPosition($pos, $value);
    }

    /**
     * Sets a field from the object by Position as specified in the xml schema.
     * Zero-based.
     *
     * @param  int $pos position in xml schema
     * @param  mixed $value field value
     * @return $this|\SCallbackThemes
     */
    public function setByPosition($pos, $value)
    {
        switch ($pos) {
            case 0:
                $this->setId($value);
                break;
            case 1:
                $this->setPosition($value);
                break;
        } // switch()

        return $this;
    }

    /**
     * Populates the object using an array.
     *
     * This is particularly useful when populating an object from one of the
     * request arrays (e.g. $_POST).  This method goes through the column
     * names, checking to see whether a matching key exists in populated
     * array. If so the setByName() method is called for that column.
     *
     * You can specify the key type of the array by additionally passing one
     * of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME,
     * TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     * The default key type is the column's TableMap::TYPE_PHPNAME.
     *
     * @param      array  $arr     An array to populate the object from.
     * @param      string $keyType The type of keys the array uses.
     * @return void
     */
    public function fromArray($arr, $keyType = TableMap::TYPE_PHPNAME)
    {
        $keys = SCallbackThemesTableMap::getFieldNames($keyType);

        if (array_key_exists($keys[0], $arr)) {
            $this->setId($arr[$keys[0]]);
        }
        if (array_key_exists($keys[1], $arr)) {
            $this->setPosition($arr[$keys[1]]);
        }
    }

     /**
     * Populate the current object from a string, using a given parser format
     * <code>
     * $book = new Book();
     * $book->importFrom('JSON', '{"Id":9012,"Title":"Don Juan","ISBN":"0140422161","Price":12.99,"PublisherId":1234,"AuthorId":5678}');
     * </code>
     *
     * You can specify the key type of the array by additionally passing one
     * of the class type constants TableMap::TYPE_PHPNAME, TableMap::TYPE_CAMELNAME,
     * TableMap::TYPE_COLNAME, TableMap::TYPE_FIELDNAME, TableMap::TYPE_NUM.
     * The default key type is the column's TableMap::TYPE_PHPNAME.
     *
     * @param mixed $parser A AbstractParser instance,
     *                       or a format name ('XML', 'YAML', 'JSON', 'CSV')
     * @param string $data The source data to import from
     * @param string $keyType The type of keys the array uses.
     *
     * @return $this|\SCallbackThemes The current object, for fluid interface
     */
    public function importFrom($parser, $data, $keyType = TableMap::TYPE_PHPNAME)
    {
        if (!$parser instanceof AbstractParser) {
            $parser = AbstractParser::getParser($parser);
        }

        $this->fromArray($parser->toArray($data), $keyType);

        return $this;
    }

    /**
     * Build a Criteria object containing the values of all modified columns in this object.
     *
     * @return Criteria The Criteria object containing all modified values.
     */
    public function buildCriteria()
    {
        $criteria = new Criteria(SCallbackThemesTableMap::DATABASE_NAME);

        if ($this->isColumnModified(SCallbackThemesTableMap::COL_ID)) {
            $criteria->add(SCallbackThemesTableMap::COL_ID, $this->id);
        }
        if ($this->isColumnModified(SCallbackThemesTableMap::COL_POSITION)) {
            $criteria->add(SCallbackThemesTableMap::COL_POSITION, $this->position);
        }

        return $criteria;
    }

    /**
     * Builds a Criteria object containing the primary key for this object.
     *
     * Unlike buildCriteria() this method includes the primary key values regardless
     * of whether or not they have been modified.
     *
     * @throws LogicException if no primary key is defined
     *
     * @return Criteria The Criteria object containing value(s) for primary key(s).
     */
    public function buildPkeyCriteria()
    {
        $criteria = ChildSCallbackThemesQuery::create();
        $criteria->add(SCallbackThemesTableMap::COL_ID, $this->id);

        return $criteria;
    }

    /**
     * If the primary key is not null, return the hashcode of the
     * primary key. Otherwise, return the hash code of the object.
     *
     * @return int Hashcode
     */
    public function hashCode()
    {
        $validPk = null !== $this->getId();

        $validPrimaryKeyFKs = 0;
        $primaryKeyFKs = [];

        if ($validPk) {
            return crc32(json_encode($this->getPrimaryKey(), JSON_UNESCAPED_UNICODE));
        } elseif ($validPrimaryKeyFKs) {
            return crc32(json_encode($primaryKeyFKs, JSON_UNESCAPED_UNICODE));
        }

        return spl_object_hash($this);
    }

    /**
     * Returns the primary key for this object (row).
     * @return int
     */
    public function getPrimaryKey()
    {
        return $this->getId();
    }

    /**
     * Generic method to set the primary key (id column).
     *
     * @param       int $key Primary key.
     * @return void
     */
    public function setPrimaryKey($key)
    {
        $this->setId($key);
    }

    /**
     * Returns true if the primary key for this object is null.
     * @return boolean
     */
    public function isPrimaryKeyNull()
    {
        return null === $this->getId();
    }

    /**
     * Sets contents of passed object to values from current object.
     *
     * If desired, this method can also make copies of all associated (fkey referrers)
     * objects.
     *
     * @param      object $copyObj An object of \SCallbackThemes (or compatible) type.
     * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
     * @param      boolean $makeNew Whether to reset autoincrement PKs and make the object new.
     * @throws PropelException
     */
    public function copyInto($copyObj, $deepCopy = false, $makeNew = true)
    {
        $copyObj->setPosition($this->getPosition());

        if ($deepCopy) {
            // important: temporarily setNew(false) because this affects the behavior of
            // the getter/setter methods for fkey referrer objects.
            $copyObj->setNew(false);

            foreach ($this->getSCallbackss() as $relObj) {
                if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
                    $copyObj->addSCallbacks($relObj->copy($deepCopy));
                }
            }

            foreach ($this->getSCallbackThemesI18ns() as $relObj) {
                if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
                    $copyObj->addSCallbackThemesI18n($relObj->copy($deepCopy));
                }
            }

        } // if ($deepCopy)

        if ($makeNew) {
            $copyObj->setNew(true);
            $copyObj->setId(NULL); // this is a auto-increment column, so set to default value
        }
    }

    /**
     * Makes a copy of this object that will be inserted as a new row in table when saved.
     * It creates a new object filling in the simple attributes, but skipping any primary
     * keys that are defined for the table.
     *
     * If desired, this method can also make copies of all associated (fkey referrers)
     * objects.
     *
     * @param  boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
     * @return \SCallbackThemes Clone of current object.
     * @throws PropelException
     */
    public function copy($deepCopy = false)
    {
        // we use get_class(), because this might be a subclass
        $clazz = get_class($this);
        $copyObj = new $clazz();
        $this->copyInto($copyObj, $deepCopy);

        return $copyObj;
    }


    /**
     * Initializes a collection based on the name of a relation.
     * Avoids crafting an 'init[$relationName]s' method name
     * that wouldn't work when StandardEnglishPluralizer is used.
     *
     * @param      string $relationName The name of the relation to initialize
     * @return void
     */
    public function initRelation($relationName)
    {
        if ('SCallbacks' == $relationName) {
            $this->initSCallbackss();
            return;
        }
        if ('SCallbackThemesI18n' == $relationName) {
            $this->initSCallbackThemesI18ns();
            return;
        }
    }

    /**
     * Clears out the collSCallbackss collection
     *
     * This does not modify the database; however, it will remove any associated objects, causing
     * them to be refetched by subsequent calls to accessor method.
     *
     * @return void
     * @see        addSCallbackss()
     */
    public function clearSCallbackss()
    {
        $this->collSCallbackss = null; // important to set this to NULL since that means it is uninitialized
    }

    /**
     * Reset is the collSCallbackss collection loaded partially.
     */
    public function resetPartialSCallbackss($v = true)
    {
        $this->collSCallbackssPartial = $v;
    }

    /**
     * Initializes the collSCallbackss collection.
     *
     * By default this just sets the collSCallbackss collection to an empty array (like clearcollSCallbackss());
     * however, you may wish to override this method in your stub class to provide setting appropriate
     * to your application -- for example, setting the initial array to the values stored in database.
     *
     * @param      boolean $overrideExisting If set to true, the method call initializes
     *                                        the collection even if it is not empty
     *
     * @return void
     */
    public function initSCallbackss($overrideExisting = true)
    {
        if (null !== $this->collSCallbackss && !$overrideExisting) {
            return;
        }

        $collectionClassName = SCallbacksTableMap::getTableMap()->getCollectionClassName();

        $this->collSCallbackss = new $collectionClassName;
        $this->collSCallbackss->setModel('\SCallbacks');
    }

    /**
     * Gets an array of ChildSCallbacks objects which contain a foreign key that references this object.
     *
     * If the $criteria is not null, it is used to always fetch the results from the database.
     * Otherwise the results are fetched from the database the first time, then cached.
     * Next time the same method is called without $criteria, the cached collection is returned.
     * If this ChildSCallbackThemes is new, it will return
     * an empty collection or the current collection; the criteria is ignored on a new object.
     *
     * @param      Criteria $criteria optional Criteria object to narrow the query
     * @param      ConnectionInterface $con optional connection object
     * @return ObjectCollection|ChildSCallbacks[] List of ChildSCallbacks objects
     * @throws PropelException
     */
    public function getSCallbackss(Criteria $criteria = null, ConnectionInterface $con = null)
    {
        $partial = $this->collSCallbackssPartial && !$this->isNew();
        if (null === $this->collSCallbackss || null !== $criteria  || $partial) {
            if ($this->isNew() && null === $this->collSCallbackss) {
                // return empty collection
                $this->initSCallbackss();
            } else {
                $collSCallbackss = ChildSCallbacksQuery::create(null, $criteria)
                    ->filterBySCallbackThemes($this)
                    ->find($con);

                if (null !== $criteria) {
                    if (false !== $this->collSCallbackssPartial && count($collSCallbackss)) {
                        $this->initSCallbackss(false);

                        foreach ($collSCallbackss as $obj) {
                            if (false == $this->collSCallbackss->contains($obj)) {
                                $this->collSCallbackss->append($obj);
                            }
                        }

                        $this->collSCallbackssPartial = true;
                    }

                    return $collSCallbackss;
                }

                if ($partial && $this->collSCallbackss) {
                    foreach ($this->collSCallbackss as $obj) {
                        if ($obj->isNew()) {
                            $collSCallbackss[] = $obj;
                        }
                    }
                }

                $this->collSCallbackss = $collSCallbackss;
                $this->collSCallbackssPartial = false;
            }
        }

        return $this->collSCallbackss;
    }

    /**
     * Sets a collection of ChildSCallbacks objects related by a one-to-many relationship
     * to the current object.
     * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
     * and new objects from the given Propel collection.
     *
     * @param      Collection $sCallbackss A Propel collection.
     * @param      ConnectionInterface $con Optional connection object
     * @return $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function setSCallbackss(Collection $sCallbackss, ConnectionInterface $con = null)
    {
        /** @var ChildSCallbacks[] $sCallbackssToDelete */
        $sCallbackssToDelete = $this->getSCallbackss(new Criteria(), $con)->diff($sCallbackss);


        $this->sCallbackssScheduledForDeletion = $sCallbackssToDelete;

        foreach ($sCallbackssToDelete as $sCallbacksRemoved) {
            $sCallbacksRemoved->setSCallbackThemes(null);
        }

        $this->collSCallbackss = null;
        foreach ($sCallbackss as $sCallbacks) {
            $this->addSCallbacks($sCallbacks);
        }

        $this->collSCallbackss = $sCallbackss;
        $this->collSCallbackssPartial = false;

        return $this;
    }

    /**
     * Returns the number of related SCallbacks objects.
     *
     * @param      Criteria $criteria
     * @param      boolean $distinct
     * @param      ConnectionInterface $con
     * @return int             Count of related SCallbacks objects.
     * @throws PropelException
     */
    public function countSCallbackss(Criteria $criteria = null, $distinct = false, ConnectionInterface $con = null)
    {
        $partial = $this->collSCallbackssPartial && !$this->isNew();
        if (null === $this->collSCallbackss || null !== $criteria || $partial) {
            if ($this->isNew() && null === $this->collSCallbackss) {
                return 0;
            }

            if ($partial && !$criteria) {
                return count($this->getSCallbackss());
            }

            $query = ChildSCallbacksQuery::create(null, $criteria);
            if ($distinct) {
                $query->distinct();
            }

            return $query
                ->filterBySCallbackThemes($this)
                ->count($con);
        }

        return count($this->collSCallbackss);
    }

    /**
     * Method called to associate a ChildSCallbacks object to this object
     * through the ChildSCallbacks foreign key attribute.
     *
     * @param  ChildSCallbacks $l ChildSCallbacks
     * @return $this|\SCallbackThemes The current object (for fluent API support)
     */
    public function addSCallbacks(ChildSCallbacks $l)
    {
        if ($this->collSCallbackss === null) {
            $this->initSCallbackss();
            $this->collSCallbackssPartial = true;
        }

        if (!$this->collSCallbackss->contains($l)) {
            $this->doAddSCallbacks($l);

            if ($this->sCallbackssScheduledForDeletion and $this->sCallbackssScheduledForDeletion->contains($l)) {
                $this->sCallbackssScheduledForDeletion->remove($this->sCallbackssScheduledForDeletion->search($l));
            }
        }

        return $this;
    }

    /**
     * @param ChildSCallbacks $sCallbacks The ChildSCallbacks object to add.
     */
    protected function doAddSCallbacks(ChildSCallbacks $sCallbacks)
    {
        $this->collSCallbackss[]= $sCallbacks;
        $sCallbacks->setSCallbackThemes($this);
    }

    /**
     * @param  ChildSCallbacks $sCallbacks The ChildSCallbacks object to remove.
     * @return $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function removeSCallbacks(ChildSCallbacks $sCallbacks)
    {
        if ($this->getSCallbackss()->contains($sCallbacks)) {
            $pos = $this->collSCallbackss->search($sCallbacks);
            $this->collSCallbackss->remove($pos);
            if (null === $this->sCallbackssScheduledForDeletion) {
                $this->sCallbackssScheduledForDeletion = clone $this->collSCallbackss;
                $this->sCallbackssScheduledForDeletion->clear();
            }
            $this->sCallbackssScheduledForDeletion[]= $sCallbacks;
            $sCallbacks->setSCallbackThemes(null);
        }

        return $this;
    }


    /**
     * If this collection has already been initialized with
     * an identical criteria, it returns the collection.
     * Otherwise if this SCallbackThemes is new, it will return
     * an empty collection; or if this SCallbackThemes has previously
     * been saved, it will retrieve related SCallbackss from storage.
     *
     * This method is protected by default in order to keep the public
     * api reasonable.  You can provide public methods for those you
     * actually need in SCallbackThemes.
     *
     * @param      Criteria $criteria optional Criteria object to narrow the query
     * @param      ConnectionInterface $con optional connection object
     * @param      string $joinBehavior optional join type to use (defaults to Criteria::LEFT_JOIN)
     * @return ObjectCollection|ChildSCallbacks[] List of ChildSCallbacks objects
     */
    public function getSCallbackssJoinSCallbackStatuses(Criteria $criteria = null, ConnectionInterface $con = null, $joinBehavior = Criteria::LEFT_JOIN)
    {
        $query = ChildSCallbacksQuery::create(null, $criteria);
        $query->joinWith('SCallbackStatuses', $joinBehavior);

        return $this->getSCallbackss($query, $con);
    }

    /**
     * Clears out the collSCallbackThemesI18ns collection
     *
     * This does not modify the database; however, it will remove any associated objects, causing
     * them to be refetched by subsequent calls to accessor method.
     *
     * @return void
     * @see        addSCallbackThemesI18ns()
     */
    public function clearSCallbackThemesI18ns()
    {
        $this->collSCallbackThemesI18ns = null; // important to set this to NULL since that means it is uninitialized
    }

    /**
     * Reset is the collSCallbackThemesI18ns collection loaded partially.
     */
    public function resetPartialSCallbackThemesI18ns($v = true)
    {
        $this->collSCallbackThemesI18nsPartial = $v;
    }

    /**
     * Initializes the collSCallbackThemesI18ns collection.
     *
     * By default this just sets the collSCallbackThemesI18ns collection to an empty array (like clearcollSCallbackThemesI18ns());
     * however, you may wish to override this method in your stub class to provide setting appropriate
     * to your application -- for example, setting the initial array to the values stored in database.
     *
     * @param      boolean $overrideExisting If set to true, the method call initializes
     *                                        the collection even if it is not empty
     *
     * @return void
     */
    public function initSCallbackThemesI18ns($overrideExisting = true)
    {
        if (null !== $this->collSCallbackThemesI18ns && !$overrideExisting) {
            return;
        }

        $collectionClassName = SCallbackThemesI18nTableMap::getTableMap()->getCollectionClassName();

        $this->collSCallbackThemesI18ns = new $collectionClassName;
        $this->collSCallbackThemesI18ns->setModel('\SCallbackThemesI18n');
    }

    /**
     * Gets an array of ChildSCallbackThemesI18n objects which contain a foreign key that references this object.
     *
     * If the $criteria is not null, it is used to always fetch the results from the database.
     * Otherwise the results are fetched from the database the first time, then cached.
     * Next time the same method is called without $criteria, the cached collection is returned.
     * If this ChildSCallbackThemes is new, it will return
     * an empty collection or the current collection; the criteria is ignored on a new object.
     *
     * @param      Criteria $criteria optional Criteria object to narrow the query
     * @param      ConnectionInterface $con optional connection object
     * @return ObjectCollection|ChildSCallbackThemesI18n[] List of ChildSCallbackThemesI18n objects
     * @throws PropelException
     */
    public function getSCallbackThemesI18ns(Criteria $criteria = null, ConnectionInterface $con = null)
    {
        $partial = $this->collSCallbackThemesI18nsPartial && !$this->isNew();
        if (null === $this->collSCallbackThemesI18ns || null !== $criteria  || $partial) {
            if ($this->isNew() && null === $this->collSCallbackThemesI18ns) {
                // return empty collection
                $this->initSCallbackThemesI18ns();
            } else {
                $collSCallbackThemesI18ns = ChildSCallbackThemesI18nQuery::create(null, $criteria)
                    ->filterBySCallbackThemes($this)
                    ->find($con);

                if (null !== $criteria) {
                    if (false !== $this->collSCallbackThemesI18nsPartial && count($collSCallbackThemesI18ns)) {
                        $this->initSCallbackThemesI18ns(false);

                        foreach ($collSCallbackThemesI18ns as $obj) {
                            if (false == $this->collSCallbackThemesI18ns->contains($obj)) {
                                $this->collSCallbackThemesI18ns->append($obj);
                            }
                        }

                        $this->collSCallbackThemesI18nsPartial = true;
                    }

                    return $collSCallbackThemesI18ns;
                }

                if ($partial && $this->collSCallbackThemesI18ns) {
                    foreach ($this->collSCallbackThemesI18ns as $obj) {
                        if ($obj->isNew()) {
                            $collSCallbackThemesI18ns[] = $obj;
                        }
                    }
                }

                $this->collSCallbackThemesI18ns = $collSCallbackThemesI18ns;
                $this->collSCallbackThemesI18nsPartial = false;
            }
        }

        return $this->collSCallbackThemesI18ns;
    }

    /**
     * Sets a collection of ChildSCallbackThemesI18n objects related by a one-to-many relationship
     * to the current object.
     * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
     * and new objects from the given Propel collection.
     *
     * @param      Collection $sCallbackThemesI18ns A Propel collection.
     * @param      ConnectionInterface $con Optional connection object
     * @return $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function setSCallbackThemesI18ns(Collection $sCallbackThemesI18ns, ConnectionInterface $con = null)
    {
        /** @var ChildSCallbackThemesI18n[] $sCallbackThemesI18nsToDelete */
        $sCallbackThemesI18nsToDelete = $this->getSCallbackThemesI18ns(new Criteria(), $con)->diff($sCallbackThemesI18ns);


        //since at least one column in the foreign key is at the same time a PK
        //we can not just set a PK to NULL in the lines below. We have to store
        //a backup of all values, so we are able to manipulate these items based on the onDelete value later.
        $this->sCallbackThemesI18nsScheduledForDeletion = clone $sCallbackThemesI18nsToDelete;

        foreach ($sCallbackThemesI18nsToDelete as $sCallbackThemesI18nRemoved) {
            $sCallbackThemesI18nRemoved->setSCallbackThemes(null);
        }

        $this->collSCallbackThemesI18ns = null;
        foreach ($sCallbackThemesI18ns as $sCallbackThemesI18n) {
            $this->addSCallbackThemesI18n($sCallbackThemesI18n);
        }

        $this->collSCallbackThemesI18ns = $sCallbackThemesI18ns;
        $this->collSCallbackThemesI18nsPartial = false;

        return $this;
    }

    /**
     * Returns the number of related SCallbackThemesI18n objects.
     *
     * @param      Criteria $criteria
     * @param      boolean $distinct
     * @param      ConnectionInterface $con
     * @return int             Count of related SCallbackThemesI18n objects.
     * @throws PropelException
     */
    public function countSCallbackThemesI18ns(Criteria $criteria = null, $distinct = false, ConnectionInterface $con = null)
    {
        $partial = $this->collSCallbackThemesI18nsPartial && !$this->isNew();
        if (null === $this->collSCallbackThemesI18ns || null !== $criteria || $partial) {
            if ($this->isNew() && null === $this->collSCallbackThemesI18ns) {
                return 0;
            }

            if ($partial && !$criteria) {
                return count($this->getSCallbackThemesI18ns());
            }

            $query = ChildSCallbackThemesI18nQuery::create(null, $criteria);
            if ($distinct) {
                $query->distinct();
            }

            return $query
                ->filterBySCallbackThemes($this)
                ->count($con);
        }

        return count($this->collSCallbackThemesI18ns);
    }

    /**
     * Method called to associate a ChildSCallbackThemesI18n object to this object
     * through the ChildSCallbackThemesI18n foreign key attribute.
     *
     * @param  ChildSCallbackThemesI18n $l ChildSCallbackThemesI18n
     * @return $this|\SCallbackThemes The current object (for fluent API support)
     */
    public function addSCallbackThemesI18n(ChildSCallbackThemesI18n $l)
    {
        if ($l && $locale = $l->getLocale()) {
            $this->setLocale($locale);
            $this->currentTranslations[$locale] = $l;
        }
        if ($this->collSCallbackThemesI18ns === null) {
            $this->initSCallbackThemesI18ns();
            $this->collSCallbackThemesI18nsPartial = true;
        }

        if (!$this->collSCallbackThemesI18ns->contains($l)) {
            $this->doAddSCallbackThemesI18n($l);

            if ($this->sCallbackThemesI18nsScheduledForDeletion and $this->sCallbackThemesI18nsScheduledForDeletion->contains($l)) {
                $this->sCallbackThemesI18nsScheduledForDeletion->remove($this->sCallbackThemesI18nsScheduledForDeletion->search($l));
            }
        }

        return $this;
    }

    /**
     * @param ChildSCallbackThemesI18n $sCallbackThemesI18n The ChildSCallbackThemesI18n object to add.
     */
    protected function doAddSCallbackThemesI18n(ChildSCallbackThemesI18n $sCallbackThemesI18n)
    {
        $this->collSCallbackThemesI18ns[]= $sCallbackThemesI18n;
        $sCallbackThemesI18n->setSCallbackThemes($this);
    }

    /**
     * @param  ChildSCallbackThemesI18n $sCallbackThemesI18n The ChildSCallbackThemesI18n object to remove.
     * @return $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function removeSCallbackThemesI18n(ChildSCallbackThemesI18n $sCallbackThemesI18n)
    {
        if ($this->getSCallbackThemesI18ns()->contains($sCallbackThemesI18n)) {
            $pos = $this->collSCallbackThemesI18ns->search($sCallbackThemesI18n);
            $this->collSCallbackThemesI18ns->remove($pos);
            if (null === $this->sCallbackThemesI18nsScheduledForDeletion) {
                $this->sCallbackThemesI18nsScheduledForDeletion = clone $this->collSCallbackThemesI18ns;
                $this->sCallbackThemesI18nsScheduledForDeletion->clear();
            }
            $this->sCallbackThemesI18nsScheduledForDeletion[]= clone $sCallbackThemesI18n;
            $sCallbackThemesI18n->setSCallbackThemes(null);
        }

        return $this;
    }

    /**
     * Clears the current object, sets all attributes to their default values and removes
     * outgoing references as well as back-references (from other objects to this one. Results probably in a database
     * change of those foreign objects when you call `save` there).
     */
    public function clear()
    {
        $this->id = null;
        $this->position = null;
        $this->alreadyInSave = false;
        $this->clearAllReferences();
        $this->resetModified();
        $this->setNew(true);
        $this->setDeleted(false);
    }

    /**
     * Resets all references and back-references to other model objects or collections of model objects.
     *
     * This method is used to reset all php object references (not the actual reference in the database).
     * Necessary for object serialisation.
     *
     * @param      boolean $deep Whether to also clear the references on all referrer objects.
     */
    public function clearAllReferences($deep = false)
    {
        if ($deep) {
            if ($this->collSCallbackss) {
                foreach ($this->collSCallbackss as $o) {
                    $o->clearAllReferences($deep);
                }
            }
            if ($this->collSCallbackThemesI18ns) {
                foreach ($this->collSCallbackThemesI18ns as $o) {
                    $o->clearAllReferences($deep);
                }
            }
        } // if ($deep)

        // i18n behavior
        $this->currentLocale = 'ru';
        $this->currentTranslations = null;

        $this->collSCallbackss = null;
        $this->collSCallbackThemesI18ns = null;
    }

    /**
     * Return the string representation of this object
     *
     * @return string
     */
    public function __toString()
    {
        return (string) $this->exportTo(SCallbackThemesTableMap::DEFAULT_STRING_FORMAT);
    }

    // i18n behavior

    /**
     * Sets the locale for translations
     *
     * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
     *
     * @return    $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function setLocale($locale = 'ru')
    {
        $this->currentLocale = $locale;

        return $this;
    }

    /**
     * Gets the locale for translations
     *
     * @return    string $locale Locale to use for the translation, e.g. 'fr_FR'
     */
    public function getLocale()
    {
        return $this->currentLocale;
    }

    /**
     * Returns the current translation for a given locale
     *
     * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
     * @param     ConnectionInterface $con an optional connection object
     *
     * @return ChildSCallbackThemesI18n */
    public function getTranslation($locale = 'ru', ConnectionInterface $con = null)
    {
        if (!isset($this->currentTranslations[$locale])) {
            if (null !== $this->collSCallbackThemesI18ns) {
                foreach ($this->collSCallbackThemesI18ns as $translation) {
                    if ($translation->getLocale() == $locale) {
                        $this->currentTranslations[$locale] = $translation;

                        return $translation;
                    }
                }
            }
            if ($this->isNew()) {
                $translation = new ChildSCallbackThemesI18n();
                $translation->setLocale($locale);
            } else {
                $translation = ChildSCallbackThemesI18nQuery::create()
                    ->filterByPrimaryKey(array($this->getPrimaryKey(), $locale))
                    ->findOneOrCreate($con);
                $this->currentTranslations[$locale] = $translation;
            }
            $this->addSCallbackThemesI18n($translation);
        }

        return $this->currentTranslations[$locale];
    }

    /**
     * Remove the translation for a given locale
     *
     * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
     * @param     ConnectionInterface $con an optional connection object
     *
     * @return    $this|ChildSCallbackThemes The current object (for fluent API support)
     */
    public function removeTranslation($locale = 'ru', ConnectionInterface $con = null)
    {
        if (!$this->isNew()) {
            ChildSCallbackThemesI18nQuery::create()
                ->filterByPrimaryKey(array($this->getPrimaryKey(), $locale))
                ->delete($con);
        }
        if (isset($this->currentTranslations[$locale])) {
            unset($this->currentTranslations[$locale]);
        }
        foreach ($this->collSCallbackThemesI18ns as $key => $translation) {
            if ($translation->getLocale() == $locale) {
                unset($this->collSCallbackThemesI18ns[$key]);
                break;
            }
        }

        return $this;
    }

    /**
     * Returns the current translation
     *
     * @param     ConnectionInterface $con an optional connection object
     *
     * @return ChildSCallbackThemesI18n */
    public function getCurrentTranslation(ConnectionInterface $con = null)
    {
        return $this->getTranslation($this->getLocale(), $con);
    }


        /**
         * Get the [text] column value.
         *
         * @return string
         */
        public function getText()
        {
        return $this->getCurrentTranslation()->getText();
    }


        /**
         * Set the value of [text] column.
         *
         * @param string $v new value
         * @return $this|\SCallbackThemesI18n The current object (for fluent API support)
         */
        public function setText($v)
        {    $this->getCurrentTranslation()->setText($v);

        return $this;
    }

    /**
     * Code to be run before persisting the object
     * @param  ConnectionInterface $con
     * @return boolean
     */
    public function preSave(ConnectionInterface $con = null)
    {
        if (is_callable('parent::preSave')) {
            return parent::preSave($con);
        }
        return true;
    }

    /**
     * Code to be run after persisting the object
     * @param ConnectionInterface $con
     */
    public function postSave(ConnectionInterface $con = null)
    {
        if (is_callable('parent::postSave')) {
            parent::postSave($con);
        }
    }

    /**
     * Code to be run before inserting to database
     * @param  ConnectionInterface $con
     * @return boolean
     */
    public function preInsert(ConnectionInterface $con = null)
    {
        if (is_callable('parent::preInsert')) {
            return parent::preInsert($con);
        }
        return true;
    }

    /**
     * Code to be run after inserting to database
     * @param ConnectionInterface $con
     */
    public function postInsert(ConnectionInterface $con = null)
    {
        if (is_callable('parent::postInsert')) {
            parent::postInsert($con);
        }
    }

    /**
     * Code to be run before updating the object in database
     * @param  ConnectionInterface $con
     * @return boolean
     */
    public function preUpdate(ConnectionInterface $con = null)
    {
        if (is_callable('parent::preUpdate')) {
            return parent::preUpdate($con);
        }
        return true;
    }

    /**
     * Code to be run after updating the object in database
     * @param ConnectionInterface $con
     */
    public function postUpdate(ConnectionInterface $con = null)
    {
        if (is_callable('parent::postUpdate')) {
            parent::postUpdate($con);
        }
    }

    /**
     * Code to be run before deleting the object in database
     * @param  ConnectionInterface $con
     * @return boolean
     */
    public function preDelete(ConnectionInterface $con = null)
    {
        if (is_callable('parent::preDelete')) {
            return parent::preDelete($con);
        }
        return true;
    }

    /**
     * Code to be run after deleting the object in database
     * @param ConnectionInterface $con
     */
    public function postDelete(ConnectionInterface $con = null)
    {
        if (is_callable('parent::postDelete')) {
            parent::postDelete($con);
        }
    }


    /**
     * Derived method to catches calls to undefined methods.
     *
     * Provides magic import/export method support (fromXML()/toXML(), fromYAML()/toYAML(), etc.).
     * Allows to define default __call() behavior if you overwrite __call()
     *
     * @param string $name
     * @param mixed  $params
     *
     * @return array|string
     */
    public function __call($name, $params)
    {
        if (0 === strpos($name, 'get')) {
            $virtualColumn = substr($name, 3);
            if ($this->hasVirtualColumn($virtualColumn)) {
                return $this->getVirtualColumn($virtualColumn);
            }

            $virtualColumn = lcfirst($virtualColumn);
            if ($this->hasVirtualColumn($virtualColumn)) {
                return $this->getVirtualColumn($virtualColumn);
            }
        }

        if (0 === strpos($name, 'from')) {
            $format = substr($name, 4);

            return $this->importFrom($format, reset($params));
        }

        if (0 === strpos($name, 'to')) {
            $format = substr($name, 2);
            $includeLazyLoadColumns = isset($params[0]) ? $params[0] : true;

            return $this->exportTo($format, $includeLazyLoadColumns);
        }

        throw new BadMethodCallException(sprintf('Call to undefined method: %s.', $name));
    }

}
