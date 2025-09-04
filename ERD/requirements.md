<mxfile host="app.diagrams.net" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36" version="28.1.2">
  <diagram name="Page-1" id="K7dri-ecJt_sM_e9mbaR">
    <mxGraphModel dx="1479" dy="142" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="850" pageHeight="1100" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="qPUYSG4iodJtxFFh5u-j-1" value="User" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="-20" y="30" width="370" height="180" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-3" value="user_id: Primary Key, UUID, Indexed&#xa;first_name: VARCHAR, NOT NULL&#xa;last_name: VARCHAR, NOT NULL&#xa;email: VARCHAR, UNIQUE, NOT NULL&#xa;password_hash: VARCHAR, NOT NULL&#xa;phone_number: VARCHAR, NULL&#xa;role: ENUM (guest, host, admin), NOT NULL&#xa;created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-1">
          <mxGeometry x="10" y="30" width="360" height="150" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-6" value="Property" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="550" y="20" width="380" height="180" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-8" value="property_id: Primary Key, UUID, Indexed&#xa;host_id: Foreign Key, references User(user_id)&#xa;name: VARCHAR, NOT NULL&#xa;description: TEXT, NOT NULL&#xa;location: VARCHAR, NOT NULL&#xa;pricepernight: DECIMAL, NOT NULL&#xa;created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP&#xa;updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-6">
          <mxGeometry x="10" y="30" width="360" height="140" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-9" value="Booking" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="380" y="470" width="370" height="170" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-10" value="booking_id: Primary Key, UUID, Indexed&#xa;property_id: Foreign Key, references Property(property_id)&#xa;user_id: Foreign Key, references User(user_id)&#xa;start_date: DATE, NOT NULL&#xa;end_date: DATE, NOT NULL&#xa;total_price: DECIMAL, NOT NULL&#xa;status: ENUM (pending, confirmed, canceled), NOT NULL&#xa;created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-9">
          <mxGeometry x="10" y="30" width="360" height="140" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-12" value="Payment" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="360" y="750" width="370" height="110" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-13" value="payment_id: Primary Key, UUID, Indexed&#xa;booking_id: Foreign Key, references Booking(booking_id)&#xa;amount: DECIMAL, NOT NULL&#xa;payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP&#xa;payment_method: ENUM (credit_card, paypal, stripe), NOT NULL" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-12">
          <mxGeometry x="5" y="30" width="380" height="100" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-27" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.25;exitDx=0;exitDy=0;entryX=0.75;entryY=1;entryDx=0;entryDy=0;" edge="1" parent="1" source="qPUYSG4iodJtxFFh5u-j-14" target="qPUYSG4iodJtxFFh5u-j-3">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="260" y="220" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-14" value="Review" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="320" y="270" width="410" height="140" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-15" value="review_id: Primary Key, UUID, Indexed&#xa;property_id: Foreign Key, references Property(property_id)&#xa;user_id: Foreign Key, references User(user_id)&#xa;rating: INTEGER, CHECK: rating &amp;gt;= 1 AND rating &amp;lt;= 5, NOT NULL&#xa;comment: TEXT, NOT NULL&#xa;created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-14">
          <mxGeometry x="10" y="30" width="390" height="110" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-21" style="edgeStyle=none;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.75;exitY=0;exitDx=0;exitDy=0;entryX=0.5;entryY=1;entryDx=0;entryDy=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="72.5" y="445" as="sourcePoint" />
            <mxPoint x="70" y="210" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-23" style="edgeStyle=none;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=1;entryDx=0;entryDy=0;exitX=0.257;exitY=0;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="-1.8189616479702408e-13" y="445" as="sourcePoint" />
            <mxPoint x="0.05" y="210" as="targetPoint" />
            <Array as="points">
              <mxPoint x="0.05" y="360" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-16" value="Message" style="swimlane;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="-90" y="445" width="350" height="105" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-17" value="message_id: Primary Key, UUID, Indexed&#xa;sender_id: Foreign Key, references User(user_id)&#xa;recipient_id: Foreign Key, references User(user_id)&#xa;message_body: TEXT, NOT NULL&#xa;sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP" style="text;whiteSpace=wrap;html=1;" vertex="1" parent="qPUYSG4iodJtxFFh5u-j-16">
          <mxGeometry x="10" y="20" width="340" height="100" as="geometry" />
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-18" style="edgeStyle=none;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;" edge="1" parent="1" source="qPUYSG4iodJtxFFh5u-j-1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="550" y="75" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-19" style="edgeStyle=none;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.782;exitY=0.007;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="1" source="qPUYSG4iodJtxFFh5u-j-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="640" y="200" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-24" style="edgeStyle=elbowEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;" edge="1" parent="1" source="qPUYSG4iodJtxFFh5u-j-10">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="840" y="200" as="targetPoint" />
            <Array as="points">
              <mxPoint x="840" y="350" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="qPUYSG4iodJtxFFh5u-j-25" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.25;exitDx=0;exitDy=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="380" y="532.5" as="sourcePoint" />
            <mxPoint x="200" y="210" as="targetPoint" />
            <Array as="points">
              <mxPoint x="290" y="533" />
              <mxPoint x="290" y="380" />
              <mxPoint x="200" y="380" />
              <mxPoint x="200" y="210" />
            </Array>
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
