OMERO.tables
============

The OMERO.tables API unifies the storage of columnar data from various sources,
such as automated analysis results or script-based processing, and makes them
available within OMERO.

Large and small volumes of tabular data can be stored via named columns, and
retrieved in bulk or via paging. A limited query language provides basic
filtering and selecting.

Since 5.6, the client library ``omero-py`` is available on PyPI_ and Conda_.
We recommend to install the library in a Python virtual environment.
In the same environment, you should now install PyTables_ by running::

    $ pip install tables 

Note that PyTables has dropped support for Python 3.8 in the 3.9.x line, 
see `tag v3.9.1 <https://github.com/PyTables/PyTables/releases/tag/v3.9.1>`_ .
 

The interface
-------------

The :blitz_source:`slice definition file <src/main/slice/omero/Tables.ice>`
for the OMERO.tables API primarily defines two service interfaces and a type
hierarchy.


class :class:`omero.grid.Table`
    The central service for dealing with tabular data, described
    :ref:`below <tables-omero-grid-Table>`.

.. class:: omero.grid.Tables

    An internal service used for managing table services, and can be ignored
    for almost all purposes.

.. class:: omero.grid.Column

    The base class for column types which permit returning arrays of
    columnar values (Ice_ doesn't provide an :class:`Any` type, so it is
    necessary to group values of the same type). All columns in a table
    must have the same number of rows.


.. note:: Attribute names (including column names) beginning with `__`
    (double underscore) are reserved for internal use. This restriction was
    introduced in OMERO 5.1, Tables created by older versions should continue
    to work.


.. _single-value-columns:

Single value columns
^^^^^^^^^^^^^^^^^^^^

These columns store a single value in each row.

.. class:: omero.grid.FileColumn(name, description, [values])
           omero.grid.ImageColumn(name, description, [values])
           omero.grid.RoiColumn(name, description, [values])
           omero.grid.WellColumn(name, description, [values])
           omero.grid.PlateColumn(name, description, [values])

    Id-based (`long`) columns which reference :class:`omero.model.File`,
    :class:`~Image`, :class:`~Roi`, :class:`~Well` and :class:`~Plate`
    instances respectively.

.. class:: omero.grid.BoolColumn(name, description, [values])

    A value column with `bool` (non-null) values.

.. class:: omero.grid.LongColumn(name, description, [values])

    A value column with `long` (non-null, 64-bit) values.

.. class:: omero.grid.DoubleColumn(name, description, [values])

    A value column with `double` (non-null, 64-bit) values.

    :param string name: The name of the column, each column in a table must
        have a unique name.

    :param string description: The column description, may be empty.

    :param [] values: A list of values (one value per row) used to initialize a
        column (optional).

    .. attribute:: values

        A class member holding the list of values stored in the column.


.. class:: omero.grid.StringColumn(name, description, size, [ values])

    A value column which holds strings

    :param string name: The column name.

    :param string description: The column description.

    :param long size: The maximum string length that can be stored in this
        column, `>= 1`

    :param string[] values: A list of strings (optional).


Array value columns
^^^^^^^^^^^^^^^^^^^

These columns store an array in each row.

.. class:: omero.grid.FloatArrayColumn(name, description, size, [values])

    A value column with fixed-width arrays of `float` (32 bit) values.

.. class:: omero.grid.DoubleArrayColumn(name, description, size, [values])

    A value column with fixed-width arrays of `double` (64 bit) values.

.. class:: omero.grid.LongArrayColumn(name, description, size, [values])

    A value column with fixed-width arrays of `long` (64 bit) values.

    :param string name: The column name.

    :param string description: The column description.

    :param long size: The width of the array, `>= 1`

    :param [][] values: A list of arrays, each of length :attr:`size`
        (optional).


.. warning::
    The OMERO.tables service currently does limited validation of string
    and array lengths. When adding or modifying data it is essential that the
    :attr:`size` parameter of a column matches that of the underlying table.

.. warning::
    Array value columns should be considered experimental for now.




Main methods
^^^^^^^^^^^^

.. class:: omero.grid.Data

    Holds the data retrieved from a table, also used to update a table.

    .. attribute:: lastModification

        The timestamp of the last update to the table.

    .. attribute:: rowNumbers

        The row indices of the values retrieved from the table.

    .. attribute:: columns

        A list of columns


.. _tables-omero-grid-Table:

.. class:: omero.grid.Table

    The main interface to the Tables service.

    .. method:: getHeaders()

        :return: An empty list of columns describing the table. Fill in the
            :attr:`values` of these columns to add a new row to the table.

    .. method:: getNumberOfRows()

        :return: The number of rows in the table.

    .. method:: readCoordinates(rowNumbers)

        Read a set of entire rows in the table.

        :param long[] rowNumbers: A list of row indices to be retrieved from
            the table.
        :return: The requested rows as a :class:`~omero.grid.Data` object.

    .. method:: read(colNumbers, start, stop)

        Read a subset of columns and consecutive rows from a table.

        :param long[] colNumber: A list of column indices to be retrieved
            from the table (may be non-consecutive).
        :param long start: The index of the first row to retrieve.
        :param long stop: The index of the `last+1` row to retrieve (uses
            similar semantics to :func:`range`).
        :return: The requested columns and rows as a
            :class:`~omero.grid.Data` object.

        .. note:: `start=0, stop=0` currently returns the first row instead
            of empty as would be expected using the normal Python range
            semantics. This may change in future.

    .. method:: slice(colNumbers, rowNumbers)

        Read a subset of columns and rows (may be non-consecutive) from a
        table.

        :param long[] colNumbers: A list of column indices to be retrieved.
            The results will be returned in the same order as these indices.
        :param long[] rowNumbers: A list of row indices to be retrieved.
            The results will be returned in the same order as these indices.

        :return: The requested columns and rows as a
            :class:`~omero.grid.Data` object.

    .. method:: getWhereList(condition, variables, start, stop, step)

        Run a query on a table, see :ref:`tables-query-language`.

        :param string condition: The query string
        :param variables: A mapping of strings and variable values to be
            substituted into `condition`. This can often be left empty.
        :param long start: The index of the `first` row to consider.
        :param long stop: The index of the `last+1` row to consider.
        :param long step: The stepping interval between the `start` and `stop`
            rows to consider, using the same semantics as :func:`range`. Set
            to `0` to disable stepping.
        :return: A list of row indices matching the condition which can be
            passed as the first parameter of :meth:`readCoordinates` or
            :meth:`read`.

        .. note:: `variables` seems to add unnecessary complexity, should it
            be removed?

    .. method:: initialize(columns)

        Initialize a new table. Any column values are ignored, use
        :meth:`addData` to add these values.

        :param Column[] columns: A list of columns whose names and types are
            used to setup the table.

    .. method:: addData(columns)

        Append one or more full rows to the table.

        :param Column[] columns: A list of columns, such as those returned by
            :meth:`getHeaders()`, whose values are the rows to be added to the
            table.

    .. method:: update(data)

        Modify one or more columns and/or rows in a table.

        :param Data data: A :class:`~omero.grid.Data` object previously
            obtained using :meth:`read` or :meth:`readCoordinates` with column
            values to be updated.

    .. method:: setMetadata(key, value)

        Store additional properties associated with a Table.

        :param string key: A key name.
        :param string/int/float/long value: The value of the property.

    .. method:: setAllMetadata(keyvalues)

        Store multiple additional properties associated with a Table. See
        :meth:`setMetadata()`.

        :param dict keyvalues: A dictionary of key-value pairs.

    .. method:: getMetadata(key)

        Get the value of a property.

        :param string key: The property name.

        :return: A property.

    .. method:: getAllMetadata()

        Get all additional properties. See :meth:`getMetadata()`.

        :return: All key-value properties.


You many find the :ref:`Python <python_omero_tables_code_samples>` and
:ref:`Java <java_omero_tables_code_samples>` annotated code samples helpful,
in addition to the :ref:`examples <tables-examples>` and
:slicedoc_blitz:`documentation on the API
<omero/grid/Table.html>`.
These are only an introduction to using OMERO.tables and do not show its full
potential, see :ref:`tables-going-forward` for some inspiration.


Data viewing in OMERO.web
-------------------------

OMERO.web can display Table data in a separate tab by clicking on the attachment link. Furthermore it can show Table data in the Image context, given the following setup::

    Project            <-  Table (Attachments panel > link)
        |- Dataset     <-  Table (Attachments panel > link)
           |- Image 1  <-  Row values (Table panel > link to referencing Table, row values)
           |- Image 2  <-  Row values (Table panel > link to referencing Table, row values)
           |- ...

The row values of the Table attached to a Dataset or Project will be rendered for each Image that is referenced in a given row. The screenshot below shows the right-hand side panels of a selected Dataset and one of its Images in OMERO.web.

.. |screenshot1| image:: /images/omero-tables-web-screenshot-dataset.png
    :width: 300
    :alt: OMERO.tables in OMERO.web - Dataset view

.. |screenshot2| image:: /images/omero-tables-web-screenshot-image.png
    :width: 300
    :alt: OMERO.tables in OMERO.web - Image view

+--------------------------------+------------------------------------------------------+
| |screenshot1|                  |                                        |screenshot2| |
+--------------------------------+------------------------------------------------------+
| Dataset with an attached Table | Image panels with the row values of the parent Table |
+--------------------------------+------------------------------------------------------+

.. note:: The following conditions have to be fulfilled for this mechanism to work with Images:

    *  The Table needs to contain a column with the parameter ``name`` set to the value ``Image``
    *  The column has to be of the type ``ImageColumn``, ``DoubleColumn`` or ``LongColumn``

This mechanism can also be applied to the :model_doc:`Screen Plate Well <developers/screen-plate-well.html>` data objects using the respective columns listed in the previous section :ref:`Single value columns <single-value-columns>`.

.. seealso:: More Table data visualisation functionality with `OMERO\.parade <https://omero-guides.readthedocs.io/en/latest/parade/docs/index.html>`_ (user guide).


.. _tables-examples:

Examples
--------

-  Hello World:
   :source:`examples/OmeroTables/first.py <examples/OmeroTables/first.py>`
-  Creating an Table with example values for all Images of a Dataset in
   :ref:`Python <python_omero_tables_code_samples>`:
-  Creating a Measurement Table:
   :source:`examples/OmeroTables/MeasurementTable.java <examples/OmeroTables/MeasurementTable.java>`
-  Querying a Table:
   :source:`examples/OmeroTables/FindMeasurements.java <examples/OmeroTables/FindMeasurements.java>`


The implementation
------------------

Currently, each table is backed by a single HDF table. Since PyTables
(and HDF in the general case) do not support concurrent access, OMERO.tables 
provides a global locking mechanism which permits multiple views of the same 
data. Each `OMERO.tables` file (registered as an ``OriginalFile`` in the
database), is composed of a single HDF table with any number of certain 
limited column types.


.. _tables-query-language:

Query language
--------------

The query language mentioned above is *currently* the PyTables
`Condition syntax`_.
Columns are referenced by name. The following operators are supported:

-  Logical operators: ``&, |, ~``
-  Comparison operators: ``<, <=, ==, !=, >=, >``
-  Unary arithmetic operators: ``-``
-  Binary arithmetic operators: ``+, -, *, /, **, %``

and the following functions:

-  ``where(bool, number1, number2)``: number — number1 if the bool
   condition is true, number2 otherwise.
-  ``{sin,cos,tan}(float|complex)``: float\|complex — trigonometric
   sine, cosine or tangent.
-  ``{arcsin,arccos,arctan}(float|complex)``: float\|complex —
   trigonometric inverse sine, cosine or tangent.
-  ``arctan2(float1, float2)``: float — trigonometric inverse tangent of
   float1/float2.
-  ``{sinh,cosh,tanh}(float|complex)``: float\|complex — hyperbolic
   sine, cosine or tangent.
-  ``{arcsinh,arccosh,arctanh}(float|complex)``: float\|complex —
   hyperbolic inverse sine, cosine or tangent.
-  ``{log,log10,log1p}(float|complex)``: float\|complex — natural,
   base-10 and log(1+x) logarithms.
-  ``{exp,expm1}(float|complex)``: float\|complex — exponential and
   exponential minus one.
-  ``sqrt(float|complex)``: float\|complex — square root.
-  ``{real,imag}(complex)``: float — real or imaginary part of complex.
-  ``complex(float, float)``: complex — complex from real and imaginary
   parts.

for example, if `id` is the name of a :class:`~omero.grid.LongColumn`

::

    table.getWhereList(condition='(id>x)', variables={'x':omero.rtypes.rint(5)},
        start=2, stop=10, step=3)

will extract a subset of rows (2, 5, 8) as indicated by `start`, `stop` and
`step`, substitute `5` in place of `x` in the `condition`, and evaluate
`condition` so as to return the indices of rows where column `id` is greater
than `5`.



.. _tables-going-forward:

Going forward
-------------

The Tables API itself provides little more than a remotely accessible
store, think of it as a server for Excel-like spreadsheets. We are
currently looking into the facilities that can be built on top of it,
and are **very** open to suggestions. For example, the
:slicedoc_blitz:`IRoi interface <omero/api/IRoi.html>`
has been extended to filter ROIs by a given
measurement. This allows seeing only those results from a particular
analysis run. The following example shows how to set up such a
measurement and retrieve its results:

:source:`iroi.py <examples/OmeroTables/iroi.py>`

For an example of production code that parses out such measurements,
see :py_source:`populate_roi.py <src/omero/util/populate_roi.py>`.

The `IRoi` interface has been integrated into OMERO.insight, allowing for
the visualization and export of OMERO.tables:

.. figure:: /images/MeasurementListSep09.png
    :align: center
    :alt: Choice between multiple measurements

    Choice between multiple measurements

We are also looking into a NoSQL-style storage mechanism for OMERO, either as
an alternative back-end to OMERO.tables or as an additional key-value type
store. Any suggestions or ideas would be
:doc:`very welcome </users/community-resources>`.



.. seealso::

    PyTables_
        Software on which OMERO.tables is built.

    `Condition Syntax <http://pytables.org/usersguide/condition_syntax.html>`_
        The PyTables condition syntax.

    :blitz_source:`slice definition file <src/main/slice/omero/Tables.ice>`
        The API definition for OMERO.tables

    :sourcedir:`The Tables test suite <components/tools/OmeroPy/test/integration/tablestest/>`
        The testsuite for OMERO.tables
